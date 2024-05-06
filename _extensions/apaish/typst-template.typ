// document mode
#let doc(
  title: none,
  running-head: none,
  authors: none,
  affiliations: none,
  authornote: none,
  abstract: none,
  keywords: none,
  margin: (x: 2.5cm, y: 2.5cm),
  paper: "us-letter",
  font: ("New Computer Modern"),
  fontsize: 11pt,
  leading: 0.55em,
  spacing: 0.55em,
  first-line-indent: 1.25cm,
  toc: false,
  cols: 1,
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
      #v(6em)#block(below: leading*4)[
        #text(size: fontsize*1.4)[#title]
      ]
    ]
  }
  
  if authornote != none {
    footnote(numbering: "*", authornote)
    counter(footnote).update(0)
  }
  
  if authors != none {
    align(center)[
      #block(below: leading*2)[
        #set text(size: fontsize*1.15)
        // Formatting depends on N authors 1, 2, or 2+
        #if authors.len() > 2 {
          for a in authors [
            #a.name#super[#a.affiliations]#if a!=authors.at(authors.len()-1) [#if a==authors.at(authors.len()-2) [, and] else [,]]
          ]
        } 
        #if authors.len() == 2 {
          for a in authors [
            #a.name#super[#a.affiliations]#if a!=authors.at(authors.len()-1) [and]
          ]
        }
        #if authors.len() == 1 {
          for a in authors [
            #a.name#super[#a.affiliations]
          ]
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
    block(inset: (x: 10%, y: 0%), below: 3em)[
      #align(center, text("Abstract"))
      #set par(first-line-indent: 0pt, leading: leading)
      #abstract
      #if keywords != none {[
        #v(1em)#text(weight: "regular", style: "italic")[Keywords:] #h(0.25em) #keywords
      ]}
    ]
  }

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

// Manuscript mode
#let man(
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
  fontsize: 12pt,
  leading: 2em,
  spacing: 2em,
  first-line-indent: 1.25cm,
  toc: false,
  cols: 1,
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
  
  set par(
    justify: false, 
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
      #v(8em)#block(below: leading*2)[
        #text(weight: "bold", size: fontsize)[#title]
      ]
    ]
  }
  
  if authornote != none {
    footnote(numbering: "*", authornote)
    counter(footnote).update(0)
  }
  
  if authors != none {
    align(center)[
      #block(above: leading, below: leading)[
        // Formatting depends on N authors 1, 2, or 2+
        #if authors.len() > 2 {
          for a in authors [
            #a.name#super[#a.affiliations]#if a!=authors.at(authors.len()-1) [#if a==authors.at(authors.len()-2) [, and] else [,]]
          ]
        } 
        #if authors.len() == 2 {
          for a in authors [
            #a.name#super[#a.affiliations]#if a!=authors.at(authors.len()-1) [and]
          ]
        }
        #if authors.len() == 1 {
          for a in authors [
            #a.name#super[#a.affiliations]
          ]
        }
      ]
      #counter(footnote).update(0)
    ]
  }
  
  if affiliations != none {
    align(center)[
      #block(above: leading, below: leading)[
        #for a in affiliations [
          #super[#a.id]#a.name \
        ]
      ]
    ]
  }

  pagebreak()
  
  if abstract != none {
    block(above: 0em, below: 2em)[
      #align(center, text(weight: "bold", "Abstract"))
      #set par(first-line-indent: 0pt, leading: leading)
      #abstract
      #if keywords != none {[
        #text(weight: "regular", style: "italic")[Keywords:] #h(0.25em) #keywords
      ]}
    ]
  }
  pagebreak()

  /* Redefine headings up to level 5 */
  show heading.where(
    level: 1
  ): it => block(width: 100%, below: leading, above: leading)[
    #set align(center)
    #set text(size: fontsize)
    #it.body
  ]

  show heading.where(
    level: 2
  ): it => block(width: 100%, below: leading, above: leading)[
    #set align(left)
    #set text(size: fontsize)
    #it.body
  ]

  show heading.where(
    level: 3
  ): it => block(width: 100%, below: leading, above: leading)[
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

// Journal mode
#let jou(
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
  
  if authornote != none {
    footnote(numbering: "*", authornote)
    counter(footnote).update(0)
  }
  
  if authors != none {
    align(center)[
      #block(below: leading*2)[
        #set text(size: fontsize*1.3)
        // Formatting depends on N authors 1, 2, or 2+
        #if authors.len() > 2 {
          for a in authors [
            #a.name#super[#a.affiliations]#if a!=authors.at(authors.len()-1) [#if a==authors.at(authors.len()-2) [, and] else [,]]
          ]
        } 
        #if authors.len() == 2 {
          for a in authors [
            #a.name#super[#a.affiliations]#if a!=authors.at(authors.len()-1) [and]
          ]
        }
        #if authors.len() == 1 {
          for a in authors [
            #a.name#super[#a.affiliations]
          ]
        }
      ]
      #counter(footnote).update(0)
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
