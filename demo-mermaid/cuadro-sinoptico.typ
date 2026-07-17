// cuadro-sinoptico.typ — Cuadro sinóptico tipo árbol jerárquico
// Uso:
//   #cuadro-sinoptico(
//     titulo: "Título",
//     (label: "Categoría", items: (
//       (label: "Sub1"),
//       (label: "Sub2"),
//     )),
//   )

#let azul = rgb("#2C3E50")
#let gris-fondo = rgb("#F5F5F0")

#let cuadro-sinoptico(titulo: "", ..ramas) = {
  let ramas-arr = ramas.pos()

  let render-rama(rama, depth: 0, is-last: false, parent-prefix: "") = {
    let lines = ()
    let label = rama.label
    let items = if "items" in rama { rama.items } else { () }

    let prefix = parent-prefix
    if depth > 0 {
      if is-last { prefix += "    " } else { prefix += "│   " }
    }

    let connector = if depth > 0 {
      if is-last { "└── " } else { "├── " }
    } else { "" }

    let label-text = {
      set text(
        weight: if depth <= 1 { "bold" } else { "regular" },
        size: if depth == 0 { 10.5pt } else if depth == 1 { 10pt } else { 9pt },
        fill: if depth == 0 { azul } else if depth == 1 { rgb("#34495E") } else { rgb("#333333") },
      )
      [#connector#label]
    }

    lines.push((prefix: prefix, content: label-text))

    if items.len() > 0 {
      for i in range(items.len()) {
        let child = items.at(i)
        let child-lines = render-rama(
          child,
          depth: depth + 1,
          is-last: i == items.len() - 1,
          parent-prefix: prefix,
        )
        for cl in child-lines {
          lines.push(cl)
        }
      }
    }

    lines
  }

  let all-lines = ()
  for i in range(ramas-arr.len()) {
    let rama = ramas-arr.at(i)
    let lines = render-rama(rama, depth: 0, is-last: i == ramas-arr.len() - 1)
    all-lines += lines
    if i < ramas-arr.len() - 1 {
      all-lines.push((prefix: "", content: v(3pt)))
    }
  }

  block(
    fill: gris-fondo,
    stroke: 1pt + azul,
    inset: (x: 12pt, y: 8pt),
    width: 100%,
    radius: 4pt,
  )[
    #text(weight: "bold", size: 11pt, fill: azul, titulo)
    #v(6pt)
    #for line in all-lines {
      let p = line.prefix
      let c = line.content
      if p == "" and type(c) == "content" {
        c
      } else {
        [#text(font: "Consolas", size: 9.5pt, fill: rgb("#777777"), p) #c]
      }
      v(2.5pt)
    }
  ]
}
