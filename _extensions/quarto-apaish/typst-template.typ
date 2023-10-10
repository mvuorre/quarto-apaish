
// This is an example typst template (based on the default template that ships
// with Quarto). It defines a typst function named 'article' which provides
// various customization options. This function is called from the 
// 'typst-show.typ' file (which maps Pandoc metadata function arguments)
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-show.typ' entirely. You can find 
// documentation on creating typst templates and some examples here: 
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates

#let article(
  title: none,
  runninghead: none,
  authors: none,
  date: none,
  abstract: none,
  cols: 1,
  margin: (x: 1in, y: 1in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: (),
  fontsize: 11pt,
  sectionnumbering: none,
  toc: false,
  keywords: none,
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    numbering: "1",
    number-align: bottom + center,
    header-ascent: 0%,
    header: locate(
        loc => if [#loc.page()] == [1] {
            []
        } else {
            align(
              left + horizon,
              runninghead
            )
        }
    )
    
  )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)

  if title != none {
    align(center)[#block(inset: 2em)[
      #text(weight: "bold", size: 1.5em)[#title]
    ]]
  }

  if authors != none {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #text(weight: "semibold")[#author.name] \
            #author.affiliation \
            #author.email \
            #author.orcid \
            #author.url
          ]
      )
    )
  }

  if date != none {
    align(center)[#block(inset: 1em)[
      #date
    ]]
  }

  if abstract != none {
    block(inset: 1em)[
    #text(weight: "semibold")[Abstract.] #h(0.5em) #abstract
    ]
  }
  
  if keywords != none {
    block(inset: 1em)[
    #text(weight: "semibold")[Keywords.] #h(0.5em) #keywords
    ]
  }

  if toc {
    block(above: 0em, below: 2em)[
    #outline(
      title: auto,
      depth: none
    );
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
