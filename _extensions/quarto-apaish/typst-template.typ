
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
  affiliations: none,
  date: none,
  authornote: none,
  abstract: none,
  cols: 1,
  margin: (x: 0.75in, y: 1.25in),
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
              center + horizon,
              runninghead
            )
        }
    ),
  )
  
  set par(
    justify: true, 
    leading: 0.55em
  )
  
  set text(
    lang: lang,
    region: region,
    font: font,
    size: fontsize
  )
  
  set heading(
    numbering: sectionnumbering
  )

  if title != none {
    align(center)[
      #block(inset: 2em, below: 0em)[
        #text(weight: "bold", size: 1.5em)[#title]
      ]
    ]
  }

  if authors != none {
    align(center)[
      #block(inset: 10%, above: 0em, below: 0.5em)[
        #for a in authors [
          #text(weight: "medium", size: 1.25em)[#a.name]#super[#a.affiliations]#a.corresponding \
        ]
      ]
    ]
  }
  
  if affiliations != none {
    align(center)[
      #block(inset: 10%, above: 0em, below: 0em)[
        #for a in affiliations [
          #super[#a.id] #a.string \
        ]
      ]
    ]
  }

  if abstract != none {
    block(inset: 10%, above: 0em, below: 2em)[
      #abstract
      #if keywords != none {[
        #text(weight: "regular", style: "italic")[Keywords:] #h(0.25em) #keywords
      ]} \
      #if date != none {[
        #text(weight: "regular", style: "italic")[Date:] #h(0.25em) #date
      ]} \
      #if authornote != none {[
        #text(weight: "regular", style: "italic")[Author note:] #h(0.25em) #authornote
      ]}
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
