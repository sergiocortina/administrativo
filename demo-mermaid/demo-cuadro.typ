#import "cuadro-sinoptico.typ": cuadro-sinoptico

#set page(
  paper: "us-letter",
  margin: (left: 2.8cm, right: 2.2cm, top: 2cm, bottom: 2.2cm),
  header: [UNIDAD 1. INTRODUCCIÓN AL DERECHO ADMINISTRATIVO],
  header-ascent: 1.5cm,
  footer: context { counter(page).display() },
  numbering: "1"
)

#set text(font: "Times New Roman", size: 11pt)
#set par(leading: 0.65em)

#let azul = rgb("#2C3E50")
#let naranja = rgb("#E67E22")
#let gris-fondo = rgb("#F5F5F0")
#let azul-claro = rgb("#D6E4F0")

#let caja-titulo(cuerpo) = {
  block(
    fill: gris-fondo,
    stroke: 1pt + azul,
    inset: 12pt,
    width: 100%,
    radius: 4pt,
  )[#text(weight: "bold", size: 14pt, fill: azul, cuerpo)]
}

#let recuadro(cuerpo) = {
  block(
    fill: gris-fondo,
    stroke: 1pt + naranja,
    inset: 8pt,
    width: 100%,
    radius: 4pt,
  )[#cuerpo]
}

#align(center, text(weight: "bold", size: 18pt, fill: azul)[UNIDAD 1])
#v(4pt)
#align(center, text(weight: "bold", size: 14pt, fill: azul)[INTRODUCCIÓN AL DERECHO ADMINISTRATIVO])

#line(length: 100%, stroke: 2pt + naranja)
#v(12pt)

#caja-titulo[Cuadro Sinóptico]
#v(8pt)

#recuadro[
  *Guía de lectura:* Este cuadro presenta la estructura completa de la unidad en formato sinóptico. Úselo como mapa de navegación antes de la exposición teórica y como referencia visual durante el estudio.
]

#v(8pt)

#cuadro-sinoptico(
  titulo: "UNIDAD 1. INTRODUCCIÓN AL DERECHO ADMINISTRATIVO — Cuadro Sinóptico",

  (label: "Evolución histórica", items: (
    (label: "Antigüedad y Estado policía"),
    (label: "Nacimiento del constitucionalismo"),
    (label: "Instituciones del absolutismo que perviven"),
    (label: "Jurisdicción administrativa"),
    (label: "Escuelas del derecho administrativo"),
  )),

  (label: "Concepto y criterios", items: (
    (label: "Criterio legalista"),
    (label: "Criterio subjetivo u orgánico"),
    (label: "Criterio objetivo o material"),
    (label: "Criterio mixto (prevaleciente)"),
  )),

  (label: "Caracteres esenciales", items: (
    (label: "Autónomo"),
    (label: "Dinámico"),
    (label: "Localista"),
    (label: "Exorbitante"),
    (label: "Intervencionista"),
  )),

  (label: "Función administrativa", items: (
    (label: "Distinción de función legislativa"),
    (label: "Distinción de función jurisdiccional"),
    (label: "Criterios de distinción"),
  )),

  (label: "Relaciones con otras ramas", items: (
    (label: "Derecho constitucional"),
    (label: "Derecho penal"),
    (label: "Derecho civil"),
    (label: "Derecho fiscal"),
    (label: "Derecho internacional público"),
    (label: "Derecho procesal"),
    (label: "Derecho laboral"),
    (label: "Derecho ambiental"),
    (label: "Derecho económico"),
    (label: "Derecho municipal"),
  )),

  (label: "Principios del derecho administrativo", items: (
    (label: "Legalidad"),
    (label: "Supremacía del interés público"),
    (label: "Seguridad jurídica"),
    (label: "Debido proceso y audiencia"),
    (label: "Proporcionalidad y razonabilidad"),
    (label: "Buena fe y confianza legítima"),
    (label: "Presunción de legalidad"),
    (label: "Ejecutoriedad y autotutela"),
    (label: "Objetividad, imparcialidad y eficiencia"),
    (label: "Transparencia y rendición de cuentas"),
  )),
)

#pagebreak()

#caja-titulo[Objetivos de aprendizaje]
#v(6pt)

1. *Comprender* el origen histórico del derecho administrativo como rama autónoma del derecho público, identificando las instituciones del absolutismo que perviven en la actualidad.
2. *Identificar* y contrastar los diversos criterios doctrinales para definir el derecho administrativo.
3. *Analizar* los caracteres esenciales del derecho administrativo y su significado práctico.
4. *Distinguir* la función administrativa de las funciones legislativa y jurisdiccional del Estado mediante criterios formales, materiales y orgánicos.
5. *Evaluar* críticamente las relaciones del derecho administrativo con otras ramas del ordenamiento jurídico.
6. *Explicar* la teoría de la doble personalidad del Estado y su evolución hacia la teoría de la personalidad única.

#v(12pt)

#caja-titulo[Competencias a desarrollar]
#v(6pt)

*Análisis jurídico:* Capacidad para identificar los elementos definitorios del derecho administrativo y distinguirlo de otras ramas jurídicas.

*Pensamiento crítico:* Habilidad para evaluar la pervivencia de instituciones del absolutismo en el Estado constitucional contemporáneo.

*Argumentación jurídica:* Aptitud para sostener razonadamente la naturaleza jurídica de la función administrativa.

*Comprensión histórica:* Competencia para contextualizar las instituciones actuales del derecho administrativo en su devenir histórico.

#pagebreak()

#caja-titulo[Exposición teórica — 1.1 Evolución histórica]
#v(6pt)

#recuadro[*Referencia al cuadro:* Está en la rama *Evolución Histórica* del Cuadro Sinóptico. Siga la secuencia: Antigüedad → Constitucionalismo → Instituciones que perviven → Jurisdicción administrativa → Escuelas.]

#v(8pt)

*1.1.1 La antigüedad y el Estado policía*

El derecho administrativo, en sentido amplio, regula las relaciones del Estado con los administrados, por lo que esta rama jurídica ha existido desde la formación misma del Estado, incluso en las organizaciones más primitivas: hordas, tribus y ciudades-Estado (Hamdan, Tema I). Sin embargo, en los Estados primigenios no existía conciencia sobre dicha rama jurídica, ni podían construirse principios científicos, porque simplemente no se diferenciaba entre el Estado y los administrados.

[El resto del contenido de la unidad continúa íntegramente con su exposición teórica completa, doctrina comparada, legislación, casos prácticos, autoevaluación y lecturas complementarias...]
