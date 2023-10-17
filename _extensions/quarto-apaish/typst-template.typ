// Typst template

#let article(
  title: none,
  running-head: none,
  authors: none,
  affiliations: none,
  date: none,
  authornote: none,
  abstract: none,
  keywords: none,
  cols: 1,
  margin: (x: 1in, y: 1in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: ("Times New Roman"),
  fontsize: 10pt,
  leading: 1em,
  spacing: 1em,
  toc: false,
  doc,
) = {

  set page(
    paper: paper,
    margin: margin,
    header-ascent: 50%,
    header: grid(
      columns: (1fr, 1fr),
      align(left)[#running-head],
      align(right)[#counter(page).display()]
    )
  )
  
  set text(
    lang: lang,
    region: region,
    font: font,
    size: fontsize
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

  set par(
    justify: true, 
    leading: leading, 
    first-line-indent: 0.5in
  )

  // Also "leading" space between paragraphs
  show par: set block(spacing: spacing)

  if abstract != none {
    block(inset: 10%, above: 0em, below: 2em)[
      #set par(first-line-indent: 0pt, leading: leading)
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

  /* Redefine headings up to level 5 */
  show heading.where(
    level: 1
  ): it => block(width: 100%, below: 12pt)[
    #set align(center)
    #set text(size: fontsize)
    #it.body
  ]

  show heading.where(
    level: 2
  ): it => block(width: 100%, below: 12pt)[
    #set align(left)
    #set text(size: fontsize)
    #it.body
  ]

  show heading.where(
    level: 3
  ): it => block(width: 100%, below: 12pt)[
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
    columns(cols, doc)
  }
  
}
