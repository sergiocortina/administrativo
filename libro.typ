// ============================================================
// LIBRO: PROGRAMA DE DERECHO ADMINISTRATIVO
// Compila: typst compile libro.typ
// ============================================================

#import "recursos/plantilla-libro.typ": *

// --- Configuración global (no se hereda con #import) ---
#set page(
  paper: "us-letter",
  margin: (left: 2.8cm, right: 2.2cm, top: 2cm, bottom: 2.2cm),
  numbering: "1",
  number-align: center,
  header: context {
    set text(size: 8pt, fill: luma(120))
    box(
      width: 100%,
      align(center, "Curso de Derecho Administrativo, Sergio Cortina")
    )
    block(stroke: (bottom: 0.3pt + luma(200)), width: 100%, height: 0pt)
    v(0.3em)
  },
)

#set text(
  font: ("Times New Roman", "Georgia", "Palatino Linotype", "Arial"),
  size: 11pt,
  lang: "es",
)

#set par(
  leading: 0.65em,
  justify: true,
)

// --- Portada ---
#portada(
  titulo: "DERECHO ADMINISTRATIVO",
  subtitulo: "Tercer Semestre — Licenciatura en Derecho",
  institucion: "UNIVERSIDAD",
  fecha: "Julio 2026",
)

#pagebreak()

// --- Índice general ---
#configurar-toc()

#pagebreak()

// --- Unidades ---
#include "output/typ/01-introduccion-al-derecho-administrativo.typ"
#pagebreak()
#include "output/typ/02-fuentes-del-derecho-administrativo.typ"
#pagebreak()
#include "output/typ/03-la-organizacion-administrativa.typ"
#pagebreak()
#include "output/typ/04-el-servidor-publico.typ"
#pagebreak()
#include "output/typ/05-teoria-del-acto-administrativo.typ"
#pagebreak()
#include "output/typ/06-el-procedimiento-administrativo.typ"
#pagebreak()
#include "output/typ/07-ineficacias-del-acto-administrativo.typ"
#pagebreak()
#include "output/typ/08-el-contrato-administrativo.typ"
#pagebreak()
#include "output/typ/09-el-servicio-publico-y-la-concesion.typ"
#pagebreak()
#include "output/typ/10-control-de-la-administracion-publica.typ"
#pagebreak()
#include "output/typ/11-el-patrimonio-del-estado-y-la-expropiacion.typ"
#pagebreak()
#include "output/typ/12-responsabilidad-patrimonial-del-estado.typ"
#pagebreak()
#include "output/typ/13-recursos-administrativos.typ"
#pagebreak()
#include "output/typ/14-juicio-de-amparo-controversia-y-accion.typ"
#pagebreak()
#include "output/typ/15-responsabilidades-administrativas-de-servidores.typ"
#pagebreak()
#include "output/typ/99-glosario.typ"
#pagebreak()
#include "output/typ/98-bibliografia.typ"
