
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
    header-ascent: 50%,
    header: grid(
      columns: (1fr, 1fr),
      align(left)[#runninghead],
      align(right)[#counter(page).display()]
    )
  )
  
  set par(
    justify: true, 
    leading: 0.55em, 
    first-line-indent: 0.5in
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
        #text(weight: "bold", size: fontsize)[#title]
      ]
    ]
  }

  if authors != none {
    align(center)[
      #block(inset: 10%, above: 0em, below: 0.5em)[
        #let alast = authors.pop()
        #if authors.len() > 1 {
          // If multiple authors, join appropriately
          for a in authors [
            #a.name#h(-0.15em)#super[#a.affiliations]#h(0.1em)#a.corresponding, 
          ] + [and #alast.name#super[#alast.affiliations]#alast.corresponding]
        } else {
          // If only one author, format a string
          [#alast.name#super[#alast.affiliations]#alast.corresponding]
        }
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
      #set par(first-line-indent: 0pt)
      #abstract
      #if keywords != none {[
        #text(weight: "regular", style: "italic")[Keywords:] #h(0.25em) #keywords
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
