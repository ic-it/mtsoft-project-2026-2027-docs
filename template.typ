// Hand-written report template. No DOCX/PDF conversion or generated paragraph model.
#let accent = rgb("274e13")
#let ink = rgb("1d241e")
#let muted = rgb("667067")
#let rule = rgb("a6b1a7")
#let tint = rgb("f1f4f0")

#let project(body) = {
  set document(title: "Projekt 1 — Testovací plán — Správa bytového domu", author: (
    "Illia Chaban", "Oleksandr Sakalosh", "Anna Sikalenko", "Anna Pylypenko", "Rebeka Žofajová",
  ))
  set page(paper: "a4", margin: (top: 21mm, bottom: 19mm, left: 18mm, right: 18mm),
    header-ascent: 5mm, footer-descent: 8mm,
    header: context if counter(page).get().first() > 1 {
      text(size: 8.5pt, fill: muted)[cv05_sk01 | Projekt 1 | Správa bytového domu]
      v(2mm)
      line(length: 100%, stroke: 0.4pt + rule)
    },
    footer: context if counter(page).get().first() > 1 {
      align(right, text(size: 8.5pt, fill: muted, counter(page).display()))
    },
  )
  set text(font: "Times New Roman", size: 10.5pt, lang: "sk", fill: ink, hyphenate: false)
  set smartquote(enabled: false)
  set par(justify: true, leading: 0.58em, spacing: 0.65em, first-line-indent: 0pt)
  set heading(numbering: none, outlined: true)
  show heading.where(level: 1): set text(size: 18pt, weight: "bold", fill: ink)
  show heading.where(level: 1): set block(above: 1.5em, below: 0.8em)
  show heading.where(level: 2): set text(size: 13pt, weight: "bold", fill: ink)
  show heading.where(level: 2): set block(above: 1.1em, below: 0.65em)
  set list(indent: 11pt, body-indent: 5pt, tight: false, spacing: 0.7em)
  set enum(indent: 0pt, body-indent: 4pt, spacing: 0.3em)
  show link: set text(fill: accent)
  show link: underline
  set outline(indent: 14pt)
  body
}

// All tables use the same rules. Rows grow with their content and stay together.
#let report-table(columns, headers, rows, size: 8.8pt, align-to: left) = {
  set text(size: size)
  set par(justify: false, leading: 0.5em, spacing: 0.55em)
  table(columns: columns, inset: (x: 5pt, y: 5pt), stroke: 0.45pt + rule,
    align: top + align-to,
    table.header(repeat: true, ..headers.map(h => table.cell(fill: accent,
      text(fill: white, weight: "bold", h)))),
    ..rows.enumerate().map(((index, row)) => row.map(cell =>
      table.cell(fill: if calc.even(index) { white } else { tint }, breakable: false, cell)
    )).flatten(),
  )
}

// For the one matrix with vertically merged cells. Coordinates remain semantic.
#let report-matrix(columns, headers, cells, size: 8.8pt) = {
  set text(size: size)
  set par(justify: false, leading: 0.5em, spacing: 0.55em)
  table(columns: columns, inset: (x: 5pt, y: 5pt), stroke: 0.45pt + rule,
    align: top + left,
    table.header(repeat: true, ..headers.map(h => table.cell(fill: accent,
      text(fill: white, weight: "bold", h)))),
    ..cells,
  )
}

#let matrix-cell(x, y, body, rowspan: 1, shade: false) = table.cell(
  x: x, y: y, rowspan: rowspan, breakable: false,
  fill: if shade { tint } else { white }, body,
)

#let caption(number, body) = block(width: 100%, above: 6pt, below: 12pt, breakable: false)[
  #align(center, text(size: 9pt, fill: muted)[Tabuľka #number: #body])
]

#let story(title, body) = [*#title* #parbreak() #body]
#let checks(..items) = enum(tight: false, spacing: 0.65em, ..items.pos())
#let conditions(..items) = items.pos().join(parbreak())

#let cover() = {
  set par(justify: false)
  image("assets/fiit-logo.jpg", width: 100%)
  v(1fr)
  align(center)[
    #text(size: 25pt, weight: "bold")[Projekt 1]
    #v(7mm)
    #text(size: 25pt, weight: "bold")[Testovací plán]
    #v(7mm)
    #text(size: 18pt, weight: "bold")[Správa bytového domu]
    #v(4mm)
    #text(size: 16pt, weight: "bold")[Release 1]
    #v(9mm)
    #text(size: 13pt)[Manažment testovania softvéru, ak. rok 2026/2027]
  ]
  v(1fr)
  grid(columns: (34mm, 1fr), gutter: 5mm,
    [Cvičenie a skupina], [cv05_sk01],
    [Autori:], [Bc. Illia Chaban, Bc. Oleksandr Sakalosh, Bc. Anna Sikalenko,
      Bc. Anna Pylypenko, Bc. Rebeka Žofajová],
  )
  v(5mm)
  [Október 2026]
  pagebreak()
}
