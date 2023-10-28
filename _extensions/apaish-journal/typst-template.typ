#let article(
  title: none,
  running-head: none,
  authors: none,
  affiliations: none,
  authornote: none,
  abstract: none,
  keywords: none,
  margin: (x: 2.5cm, y: 2.5cm),
  paper: "us-letter",
  font: ("Times New Roman"),
  fontsize: 10pt,
  leading: 0.5em, // Space between lines
  spacing: 0.5em, // Space between paragraphs
  first-line-indent: 0cm,
  toc: false,
  cols: 2,
  mode: none,
  doc,
) = {

  set page(
    paper: paper,
    margin: margin,
    header-ascent: 50%,
    header: locate(
        loc => if [#loc.page()] == [1] {
          []
        } else {
          grid(
            columns: (1fr, 1fr),
            align(left)[#running-head],
            align(right)[#counter(page).display()]
          )
        }
    ),
  )
  
  set par(
    justify: true, 
    leading: leading,
    first-line-indent: first-line-indent
  )

  // Also "leading" space between paragraphs
  show par: set block(spacing: spacing)

  set text(
    font: font,
    size: fontsize
  )

  if title != none {
    align(center)[
      #v(3em)#block(below: leading*4)[
        #text(size: fontsize*1.8)[#title]
      ]
    ]
  }
  
  if authors != none {
    align(center)[
      #block(below: leading*2)[
        #set text(size: fontsize*1.3)
        #let alast = authors.pop()
        #if authors.len() > 1 {
          // If multiple authors, join appropriately
          for a in authors [
            #a.name#super[#a.affiliations], 
          ] + [and #alast.name#super[#alast.affiliations]]
        } else {
          // If only one author, format a string
          [#alast.name#super[#alast.affiliations]]
        }
      ]
    ]
  }
  
  if affiliations != none {
    align(center)[
      #block(below: leading*2)[
        #for a in affiliations [
          #super[#a.id]#a.name \
        ]
      ]
    ]
  }

  if abstract != none {
    block(inset: (x: 15%, y: 0%), below: 3em)[
      #set text(size: 9pt)
      #set par(first-line-indent: 0pt, leading: leading)
      #abstract
      #if keywords != none {[
        #v(1em)#text(weight: "regular", style: "italic")[Keywords:] #h(0.25em) #keywords
      ]}
    ]
  }

  place(
    bottom, float: true, clearance: 1em,
    [
      #line(length: 100%, stroke: 0.5pt)
      #set text(size: fontsize*0.85)
      #authornote
      // todo: The corresponding YAML field doesn't seem to work, so hacky
      Correspondence concerning this article should be addressed to
      #for a in authors [#if a.note == "true" [#a.name, #a.email]].
    ]
  )

  /* Redefine headings up to level 5 */
  show heading.where(
    level: 1
  ): it => block(width: 100%, below: leading*2, above: leading*2)[
    #set align(center)
    #set text(size: fontsize)
    #it.body
  ]

  show heading.where(
    level: 2
  ): it => block(width: 100%, below: leading*2, above: leading*2)[
    #set align(left)
    #set text(size: fontsize)
    #it.body
  ]

  show heading.where(
    level: 3
  ): it => block(width: 100%, below: leading*2, above: leading*2)[
    #set align(left)
    #set text(size: fontsize, style: "italic")
    #it.body
  ]

  show heading.where(
    level: 4
  ): it => text(
    size: 1em,
    weight: "bold",
    it.body + [.]
  )

  show heading.where(
    level: 5
  ): it => text(
    size: 1em,
    weight: "bold",
    style: "italic",
    it.body + [.]
  )

  if cols == 1 {
    doc
  } else {
    columns(cols, gutter: 4%, doc)
  }
  
}
