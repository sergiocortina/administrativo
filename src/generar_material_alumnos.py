# -*- coding: utf-8 -*-
"""
Regenera los PDFs de "Material para Alumnos" (unidades 1-6) extrayendo páginas
del libro.pdf recién compilado (fuente de verdad: unidades/*.md corregidas).

Los nombres de salida respetan los que ya enlazan las presentaciones HTML.

Uso:
    PYTHONIOENCODING=utf-8 python src/generar_material_alumnos.py
"""
import os
import re
import sys

import fitz  # PyMuPDF

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
LIBRO = os.path.join(ROOT, "libro.pdf")
DEST = os.path.join(ROOT, "Material para Alumnos")

# Sección -> regex de su primera aparición en el PDF.
# La plantilla imprime las etiquetas con emoji delante (p. ej. "📝  Cuestionario
# de estudio"), por lo que se permite cualquier run de símbolos no-alfanuméricos
# antes del texto. "Casos/Actividades/Taller" se detectan por su primera ficha
# ("Caso práctico: ...", "Actividad: ...", "Taller práctico: ...").
PATRONES = [
    ("Cuestionario de estudio", r"^[^\w\s]*\s*Cuestionario de estudio\s*$"),
    ("Casos prácticos", r"^[^\w\s]*\s*Caso práctico:"),
    ("Actividades en clase", r"^[^\w\s]*\s*Actividad:"),
    # Respaldo U5: sus actividades quedaron sin envoltorio #actividad()
    ("Actividades en clase", r"^\s*1\.\s*Debate:"),
    # Respaldo U6: actividades numeradas sin prefijo "Actividad:"
    ("Actividades en clase", r"^\s*1\.\s*Simulación de un procedimiento administrativo sancionador"),
    ("Taller práctico", r"^[^\w\s]*\s*Taller práctico:"),
    ("Autoevaluación", r"^[^\w\s]*\s*Autoevaluación\s*$"),
]

# Nombre de archivo por (unidad, sección), según los enlaces existentes
# en diapositivas/*.html. None = no se genera PDF para esa sección.
NOMBRES = {
    (1, "Cuestionario de estudio"): "Cuestionario.pdf",
    (1, "Casos prácticos"): "Casos Prácticos.pdf",
    (1, "Autoevaluación"): "Autoevaluación.pdf",
    (2, "Cuestionario de estudio"): "Cuestionario.pdf",
    (2, "Casos prácticos"): "Casos Prácticos.pdf",
    (2, "Autoevaluación"): "Autoevaluación.pdf",
    (3, "Cuestionario de estudio"): "Cuestionario.pdf",
    (3, "Casos prácticos"): "Casos.pdf",
    (3, "Actividades en clase"): "Actividades.pdf",
    (3, "Autoevaluación"): "Autoevaluacion.pdf",
    (4, "Cuestionario de estudio"): "Cuestionario.pdf",
    (4, "Casos prácticos"): "Casos.pdf",
    (4, "Autoevaluación"): "Autoevaluación.pdf",
    (5, "Cuestionario de estudio"): "Cuestionario.pdf",
    (5, "Actividades en clase"): "Debate.pdf",
    (5, "Taller práctico"): "Taller y Evaluación.pdf",
    (6, "Cuestionario de estudio"): "Cuestionario.pdf",
    (6, "Actividades en clase"): "Taller y Evaluación.pdf",
    (6, "Autoevaluación"): "Autoevaluación.pdf",
}

PAT_UNIDAD = re.compile(r"^\s*UNIDAD\s+(\d+)\.", re.M)


def normalizar(t):
    return t.replace("\r\n", "\n").replace("\r", "\n")


def es_toc(t):
    """Página de índice general: contiene varias entradas 'UNIDAD N.'"""
    return len(PAT_UNIDAD.findall(t)) >= 3


def main():
    doc = fitz.open(LIBRO)
    n = doc.page_count
    textos = [normalizar(doc[i].get_text("text")) for i in range(n)]

    # --- Localizar el inicio real de cada unidad (excluye páginas de índice) ---
    inicio_unidad = {}
    for i, t in enumerate(textos):
        if es_toc(t):
            continue
        m = PAT_UNIDAD.search(t)
        if m:
            inicio_unidad.setdefault(int(m.group(1)), i)

    plan = {}
    for u in range(1, 7):
        if u not in inicio_unidad:
            print(f"AVISO: no se encontró UNIDAD {u} en el PDF.")
            continue
        ini = inicio_unidad[u]
        siguientes = [p for nu, p in inicio_unidad.items() if nu > u]
        fin = min(siguientes) if siguientes else n

        posiciones = {}
        for i in range(ini, fin):
            for nombre, pat in PATRONES:
                if nombre in posiciones:
                    continue
                if re.search(pat, textos[i], re.M):
                    posiciones[nombre] = i

        plan[u] = {"inicio": ini, "fin": fin, "secciones": posiciones}
        secs = ", ".join(f"{k}=p{v+1}" for k, v in sorted(posiciones.items(), key=lambda x: x[1])) or "(sin secciones)"
        print(f"U{u}: páginas {ini+1}-{fin} | {secs}")

    # --- Generar PDFs ---
    for u in range(1, 7):
        if u not in plan:
            continue
        p = plan[u]
        carpeta = os.path.join(DEST, f"Unidad {u}")
        os.makedirs(carpeta, exist_ok=True)

        # 1) Contenido: portada de la unidad -> antes de la 1ª sección de
        #    actividades (las actividades van en hojas separadas del libro).
        primera_sec = min(p["secciones"].values()) if p["secciones"] else p["fin"]
        out = os.path.join(carpeta, f"Unidad {u}.pdf")
        doc.select(list(range(p["inicio"], primera_sec)))
        doc.save(out, garbage=4, deflate=True)
        doc.close()
        doc = fitz.open(LIBRO)
        print(f"  -> Unidad {u}.pdf (págs. libro {p['inicio']+1}-{primera_sec})")

        # 2) Secciones individuales, cada una hasta el inicio de la siguiente
        for sec, ini in p["secciones"].items():
            nombre = NOMBRES.get((u, sec))
            if not nombre:
                continue
            siguientes = [v for k, v in p["secciones"].items() if v > ini]
            siguientes.append(p["fin"])
            fin_sec = min(siguientes)
            out = os.path.join(carpeta, nombre)
            doc.select(list(range(ini, fin_sec)))
            doc.save(out, garbage=4, deflate=True)
            doc.close()
            doc = fitz.open(LIBRO)
            print(f"  -> {nombre} (págs. libro {ini+1}-{fin_sec})")

    doc.close()
    print("Listo.")


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8")
    main()
