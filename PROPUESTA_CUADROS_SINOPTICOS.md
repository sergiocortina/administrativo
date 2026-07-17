# Propuesta: Cuadros Sinópticos (Mermaid `block`) en lugar de Mapas Conceptuales

## Resumen

Reemplazar la sección `### Mapa conceptual` (árboles ASCII con `├──`/`└──`) por **cuadros sinópticos formales** usando **Mermaid `block`** (disponible desde v11). Esto genera diagramas tipo "cuadro sinóptico" con columnas, ideal para documentos jurídicos/académicos.

---

## 1. Comparación Visual

### Actual (Unidad 1) — Árbol ASCII
```markdown
### Mapa conceptual
Introducción al Derecho Administrativo
├── Evolución histórica
│   ├── Antigüedad y Estado policía
│   ├── Nacimiento del constitucionalismo
│   ├── Instituciones del absolutismo que perviven
│   ├── Jurisdicción administrativa
│   └── Escuelas del derecho administrativo
├── Concepto
│   ├── Criterio legalista
│   ├── Criterio subjetivo u orgánico
│   ├── Criterio objetivo o material
│   └── Criterio mixto (prevaleciente)
├── Caracteres
│   ├── Autónomo
│   ├── Dinámico
│   ├── Localista
│   ├── Exorbitante
│   └── Intervencionista
...
```

### Propuesta — Cuadro Sinóptico Mermaid `block`
```mermaid
block
  blockTitle["UNIDAD 1. INTRODUCCIÓN AL DERECHO ADMINISTRATIVO — Cuadro Sinóptico"]
  block:Evolución_Histórica
    columns 3
      Antigüedad_y_Estado_Policía
      Nacimiento_del_Constitucionalismo
      Instituciones_Absolutismo_Perviven
      Jurisdicción_Administrativa
      Escuelas_Derecho_Administrativo
  block:Concepto_y_Criterios
    columns 4
      Criterio_Legalista
      Criterio_Subjetivo_Orgánico
      Criterio_Objetivo_Material
      Criterio_Mixto_Prevaleciente
  block:Caracteres_Essenciales
    columns 3
      Autónomo
      Dinámico
      Localista
      Exorbitante
      Intervencionista
  block:Función_Administrativa
    columns 3
      Distinción_Función_Legislativa
      Distinción_Función_Jurisdiccional
      Criterios_Distinción
  block:Relaciones_otras_Ramas
    columns 4
      Derecho_Constitucional
      Derecho_Penal
      Derecho_Civil
      Derecho_Fiscal
      Derecho_Internacional_Público
      Derecho_Procesal
      Derecho_Laboral
      Derecho_Ambiental
      Derecho_Económico
      Derecho_Municipal
  block:Principios_DA
    columns 4
      Legalidad
      Supremacía_Interés_Público
      Seguridad_Jurídica
      Debido_Proceso_y_Audiencia
      Proporcionalidad_Razonabilidad
      Buena_Fe_Confianza_Legítima
      Presunción_Legalidad
      Ejecutoriedad_Autotutela
      Objetividad_Imparcialidad_Eficiencia
      Transparencia_Rendición_Cuentas
```

---

## 2. Ventajas de `block` vs `mindmap`

| Aspecto | `mindmap` (actual) | `block` (propuesta) |
|---------|-------------------|---------------------|
| **Formato** | Árbol radial/exploratorio | Cuadro sinóptico formal, columnas |
| **Uso académico** | Mapas conceptuales, lluvia de ideas | **Cuadros sinópticos, organigramas, clasificaciones jurídicas** |
| **Lectura** | Requiere seguir ramas | Lectura tabular, comparación horizontal |
| **Impresión PDF** | Puede cortarse en ancho | Control preciso con `columns N` |
| **Estilo jurídico** | Informal | Formal, tipo esquema de cátedra |
| **Versión Mermaid** | v10+ | **v11+** (requiere actualizar renderer) |

---

## 3. Plantilla Reutilizable por Unidad

```mermaid
block
  blockTitle["UNIDAD X. TÍTULO — Cuadro Sinóptico"]
  block:Eje_Temático_1
    columns N
      Subtema_1_1
      Subtema_1_2
      Subtema_1_3
  block:Eje_Temático_2
    columns N
      Subtema_2_1
      Subtema_2_2
  block:Eje_Temático_3
    columns N
      Subtema_3_1
      Subtema_3_2
      Subtema_3_3
      Subtema_3_4
```

### Reglas de estilo

| Regla | Especificación |
|-------|----------------|
| `blockTitle` | `"UNIDAD X. TÍTULO — Cuadro Sinóptico"` |
| `columns` | 3-4 columnas máx. por bloque (legibilidad) |
| Nombres de bloques | `snake_case` sin acentos (ej: `Evolucion_Historica`) |
| Items | `Pascal_Case` sin espacios (ej: `Criterio_Legalista`) |
| Saltos de línea en items | Usar `<br/>` dentro del texto si necesario |

---

## 4. Conversión Unidad 1 — Ejemplo Completo (Contenido + Gráfico)

### Principio: **El cuadro sinóptico REFUERZA, no sustituye**

La estructura de cada unidad se mantiene intacta. El cuadro sinóptico se inserta **al inicio de la unidad** (después del título, antes de objetivos) como **síntesis visual previa** que orienta la lectura de la exposición teórica que sigue.

### Archivo: `unidades/01-introduccion-al-derecho-administrativo.md` (estructura completa)

```markdown
## UNIDAD 1. INTRODUCCIÓN AL DERECHO ADMINISTRATIVO

### Cuadro Sinóptico

> **Guía de lectura:** Este cuadro presenta la estructura completa de la unidad. Úselo como mapa de navegación antes y durante el estudio de la exposición teórica.

```mermaid
block
  blockTitle["UNIDAD 1. INTRODUCCIÓN AL DERECHO ADMINISTRATIVO — Cuadro Sinóptico"]
  block:Evolucion_Historica
    columns 3
      Antiguedad_Estado_Policia
      Nacimiento_Constitucionalismo
      Instituciones_Absolutismo_Perviven
      Jurisdiccion_Administrativa
      Escuelas_Derecho_Administrativo
  block:Concepto_y_Criterios
    columns 4
      Criterio_Legalista
      Criterio_Subjetivo_Organico
      Criterio_Objetivo_Material
      Criterio_Mixto_Prevaleciente
  block:Caracteres_Essenciales
    columns 3
      Autonomo
      Dinamico
      Localista
      Exorbitante
      Intervencionista
  block:Funcion_Administrativa
    columns 3
      Distincion_Funcion_Legislativa
      Distincion_Funcion_Jurisdiccional
      Criterios_Distincion
  block:Relaciones_otras_Ramas
    columns 4
      Derecho_Constitucional
      Derecho_Penal
      Derecho_Civil
      Derecho_Fiscal
      Derecho_Internacional_Publico
      Derecho_Procesal
      Derecho_Laboral
      Derecho_Ambiental
      Derecho_Economico
      Derecho_Municipal
  block:Principios_DA
    columns 4
      Legalidad
      Supremacia_Interes_Publico
      Seguridad_Juridica
      Debido_Proceso_Audiencia
      Proporcionalidad_Razonabilidad
      Buena_Fe_Confianza_Legitima
      Presuncion_Legalidad
      Ejecutoriedad_Autotutela
      Objetividad_Imparcialidad_Eficiencia
      Transparencia_Rendicion_Cuentas
```

### Objetivos de aprendizaje

1. **Comprender** el origen histórico del derecho administrativo como rama autónoma del derecho público, identificando las instituciones del absolutismo que perviven en la actualidad.
2. **Identificar** y contrastar los diversos criterios doctrinales para definir el derecho administrativo.
3. **Analizar** los caracteres esenciales del derecho administrativo y su significado práctico.
4. **Distinguir** la función administrativa de las funciones legislativa y jurisdiccional del Estado mediante criterios formales, materiales y orgánicos.
5. **Evaluar** críticamente las relaciones del derecho administrativo con otras ramas del ordenamiento jurídico.
6. **Explicar** la teoría de la doble personalidad del Estado y su evolución hacia la teoría de la personalidad única.

### Competencias a desarrollar

**Análisis jurídico:** Capacidad para identificar los elementos definitorios del derecho administrativo y distinguirlo de otras ramas jurídicas.

**Pensamiento crítico:** Habilidad para evaluar la pervivencia de instituciones del absolutismo en el Estado constitucional contemporáneo.

**Argumentación jurídica:** Aptitud para sostener razonadamente la naturaleza jurídica de la función administrativa.

**Comprensión histórica:** Competencia para contextualizar las instituciones actuales del derecho administrativo en su devenir histórico.

### Exposición teórica

#### 1.1 Evolución histórica del derecho administrativo

##### 1.1.1 La antigüedad y el Estado policía

El derecho administrativo, en sentido amplio, regula las relaciones del Estado con los administrados, por lo que esta rama jurídica ha existido desde la formación misma del Estado, incluso en las organizaciones más primitivas: hordas, tribus y ciudades-Estado (Hamdan, Tema I). Sin embargo, en los Estados primigenios no existía conciencia sobre dicha rama jurídica, ni podían construirse principios científicos, porque simplemente no se diferenciaba entre el Estado y los administrados.

> 📜 **Artículo 16, CPEUM.** "Nadie puede ser molestado en su persona..."

> ⚖️ **Tesis P./J. 20/2003.** DERECHO ADMINISTRATIVO. SUS CARACTERÍSTICAS...

> 📘 **Definición.** El acto administrativo es la declaración unilateral...

La primera etapa de evolución de la organización política y administrativa se identifica con las llamadas monarquías absolutas, en las que los principios jurídicos, administrativos y políticos se reducían a dos postulados: *quod regis placuit, legis est* ("lo que al rey le placía, eso era ley") y *the king can do no wrong* ("el rey nunca comete daño") (Hamdan, Tema I). Adolf Merkl, discípulo de Hans Kelsen, señaló que en este periodo oscuro imperaba "el derecho ilimitado de administrar", donde el súbdito era considerado objeto de la relación, no sujeto (Hamdan, Tema I).

Este largo periodo se conoce en la ciencia política como Estado de policía o Estado policía (*Polizeistaat*), en el que el monarca determinaba a su libre arbitrio los fines por perseguir y los medios para alcanzarlos. Como señala Fernández Ruiz (Edo. Méx., Cap. I), el poder del soberano era absoluto, total, ilimitado y omnímodo: podía disponer de las personas y de sus bienes sin más límite que su propia voluntad.

...

[RESTO DE LA EXPOSICIÓN TEÓRICA INTACTA — 150-250 líneas según especificación]

### Doctrina comparada
...

### Legislación aplicable comentada
...

### Esquema de síntesis
...

### Cuestionario de estudio
...

### Casos prácticos
...

### Actividades en clase
...

### Taller práctico
...

### Autoevaluación
...

### Lecturas complementarias
...
```

---

### Cómo refuerza el contenido (no lo sustituye)

| Momento | Función del Cuadro Sinóptico |
|---------|------------------------------|
| **Inicio de unidad** | Vista panorámica: alumno ve "el bosque" antes de "los árboles" |
| **Durante exposición teórica** | Referencia visual: "Estoy en la rama *Evolución histórica → Nacimiento del constitucionalismo*" |
| **Estudio autónomo** | Esquema de repaso: permite recorrer mentalmente la estructura |
| **Clase presencial** | Pizarra compartida: profesor señala bloques mientras explica |
| **Evaluación** | Guión para estructurar respuestas de desarrollo |

---

## 5. Integración con Pipeline Typst Actual

### Opción A: Mermaid nativo en Typst (requiere Typst 0.13+ con feature mermaid)

En `recursos/plantilla-libro.typ` agregar:

```typst
// Función para renderizar cuadros sinópticos Mermaid
#let cuadro-sinoptico(codigo) = {
  #raw(block: true, `mermaid`, codigo)
}
```

En `src/md2typ.py`, modificar `procesar_mapa_conceptual()`:

```python
def procesar_mapa_conceptual(contenido):
    """Convierte el bloque mermaid block a función Typst"""
    # Detectar si es block diagram
    if 'block\n' in contenido or 'blockTitle' in contenido:
        # Extraer el código mermaid
        match = re.search(r'```mermaid\n(.*?)\n```', contenido, re.DOTALL)
        if match:
            codigo_mermaid = match.group(1).strip()
            return f'#cuadro-sinoptico([{codigo_mermaid}])'
    # Fallback: procesar como mindmap actual
    return procesar_mapa_conceptual_legacy(contenido)
```

### Opción B: Pre-renderizar a SVG/PNG (compatible con Typst actual)

Script auxiliar `src/mermaid_to_svg.py`:

```python
#!/usr/bin/env python3
"""Convierte diagramas Mermaid block a SVG para inclusión en Typst"""
import subprocess
import re
from pathlib import Path

def mermaid_block_to_svg(mermaid_code, output_path):
    # Usar mermaid-cli (mmdc) para renderizar
    cmd = ['mmdc', '-i', '-', '-o', str(output_path), '-b', 'transparent']
    result = subprocess.run(cmd, input=mermaid_code.encode(), capture_output=True)
    return result.returncode == 0

def procesar_unidad_para_svg(unidad_path):
    contenido = Path(unidad_path).read_text(encoding='utf-8')
    # Buscar bloques ```mermaid ... ```
    bloques = re.findall(r'```mermaid\n(.*?)\n```', contenido, re.DOTALL)
    for i, bloque in enumerate(bloques):
        if 'block\n' in bloque or 'blockTitle' in bloque:
            svg_path = Path(unidad_path).parent / f"{Path(unidad_path).stem}_cuadro_{i}.svg"
            mermaid_block_to_svg(bloque, svg_path)
            # Reemplazar en markdown por include de imagen
            contenido = contenido.replace(
                f'```mermaid\n{bloque}\n```',
                f'![Cuadro Sinóptico Unidad]({svg_path.name})'
            )
    return contenido
```

### Opción C: Mantener Markdown + Mermaid en GitHub/GitLab/Notion/Obsidian

Si el PDF final se genera vía **pandoc + mermaid-filter** o **markdown-it + mermaid**, solo basta con:

1. Cambiar `### Mapa conceptual` → `### Cuadro Sinóptico`
2. Pegar el bloque ` ```mermaid block ... ``` `
3. El renderer Mermaid v11+ lo muestra nativamente

---

## 6. Plan de Migración para 18 Unidades

| Fase | Acción | Archivos |
|------|--------|----------|
| 1 | Crear plantilla base `block` | `plantillas/cuadro-sinoptico-template.mmd` |
| 2 | Convertir Unidad 1 (piloto) | `unidades/01-*.md` |
| 3 | Validar render en PDF (`typst compile`) | `libro.pdf` |
| 4 | Ajustar `columns` y nombres si hay desbordamiento | — |
| 5 | Aplicar a unidades 2-18 (script batch) | `unidades/02-*.md` a `15-*.md` |
| 6 | Actualizar `md2typ.py` para detectar `block` | `src/md2typ.py` |
| 7 | Compilación completa y revisión | `python src/md2typ.py --todas && typst compile libro.typ` |

### Script de conversión automática (borrador)

```python
# src/convertir_mapas_a_cuadros.py
import re
from pathlib import Path

MAPA_A_CUADRO = {
    # Mapeo de patrones árbol -> estructura block
    # Se aplica por unidad manualmente o con LLM
}

def arbol_a_block(texto_arbol):
    """Convierte árbol ASCII a estructura block (requiere revisión manual)"""
    lineas = texto_arbol.strip().split('\n')
    # Lógica de parsing heurística...
    pass

# Uso: revisar cada unidad, extraer sección "Mapa conceptual",
# diseñar block manualmente (30 min/unidad), reemplazar.
```

---

## 7. Ejemplos Adicionales por Tipo de Unidad

### Unidad tipo: Organización Administrativa (ej. Unidad 3)
```mermaid
block
  blockTitle["UNIDAD 3. ORGANIZACIÓN ADMINISTRATIVA — Cuadro Sinóptico"]
  block:Administracion_Publica
    columns 2
      Centralizada
      Paraestatal
  block:Centralizada
    columns 3
      Presidencial
      Secretarías_Estado
      Consejería_Jurídica
  block:Paraestatal
    columns 3
      Organismos_Descentralizados
      Empresas_Participación_Estatal
      Fideicomisos_Públicos
  block:Desconcentracion_vs_Descentralizacion
    columns 4
      Desconcentrado_Sin_Personalidad
      Desconcentrado_Con_Personalidad
      Descentralizado_Órganos
      Descentralizado_Entidades
```

### Unidad tipo: Procedimiento Administrativo (ej. Unidad 7)
```mermaid
block
  blockTitle["UNIDAD 7. PROCEDIMIENTO ADMINISTRATIVO — Cuadro Sinóptico"]
  block:Principios_Procedimentales
    columns 4
      Legalidad
      Oficialidad
      Gratuidad
      Economía_Procesal
      Concentración
      Instrucción
      Definitividad
      Imparcialidad
  block:Etapas_Procedimiento
    columns 3
      Inicio
      Instrucción
      Conclusión
  block:Inicio
    columns 3
      De_Oficio
      A_Petición_Parte
      Requisitos_Solicitud
  block:Instruccion
    columns 4
      Alegatos
      Pruebas
      Vistas
      Audiencias
  block:Conclusion
    columns 3
      Resolución
      Notificación
      Ejecución
```

### Unidad tipo: Control Jurisdiccional (ej. Unidad 14)
```mermaid
block
  blockTitle["UNIDAD 14. CONTROL JURISDICCIONAL — Cuadro Sinóptico"]
  block:Juicio_Amparo
    columns 3
      Amparo_Directo
      Amparo_Indirecto
      Amparo_en_Revisión
  block:Controversia_Constitucional
    columns 3
      Federación_vs_Estados
      Federación_vs_Municipios
      Poderes_Federación
  block:Acción_Inconstitucionalidad
    columns 3
      Leyes_Federales
      Leyes_Estatales
      Tratados_Internacionales
  block:Medios_Impugnación
    columns 4
      Revisión
      Queja
      Reclamación
      Reposición
```

---

## 8. Checklist de Validación por Unidad

- [ ] Título `blockTitle` coincide con `## UNIDAD X. TÍTULO`
- [ ] Máx. 4 columnas por bloque (`columns 3` o `columns 4`)
- [ ] Nombres de bloques en `snake_case` sin acentos
- [ ] Items en `PascalCase` legibles
- [ ] Total items por bloque ≤ 12 (legibilidad)
- [ ] Renderiza sin error en Mermaid Live Editor (v11+)
- [ ] PDF compilado: cuadro cabe en página US Letter (márgenes 2.8/2.2cm)

---

## 9. Próximos Pasos Recomendados

1. **Aprobar esta propuesta** → Confirmar uso de `block` (Mermaid v11)
2. **Verificar renderer** → `mmdc --version` o Typst con feature mermaid
3. **Piloto Unidad 1** → Aplicar plantilla, compilar PDF, revisar
4. **Batch 2-18** → Usar como referencia la Unidad 1 convertida
5. **Actualizar `md2typ.py`** → Detectar y procesar bloques `block` automáticamente

---

## 10. Referencias

- **Skill fuente**: `.agents/skills/texto-a-mermaid/SKILL.md` (sección `block` — cuadros sinópticos formales)
- **Ejemplos legales**: `.agents/skills/texto-a-mermaid/ejemplos-legales.mmd` (ejemplos 0, 8)
- **Cheatsheet**: `.agents/skills/texto-a-mermaid/cheatsheet.md`
- **Mermaid block docs**: https://mermaid.js.org/syntax/block.html (requiere v11+)