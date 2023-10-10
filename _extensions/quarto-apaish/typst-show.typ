// Typst custom formats typically consist of a 'typst-template.typ' (which is
// the source code for a typst template) and a 'typst-show.typ' which calls the
// template's function (forwarding Pandoc metadata values as required)
//
// This is an example 'typst-show.typ' file (based on the default template  
// that ships with Quarto). It calls the typst function named 'article' which 
// is defined in the 'typst-template.typ' file. 
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-template.typ' entirely. You can find
// documentation on creating typst templates here and some examples here:
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates

#show: doc => article(
$if(title)$
  title: [$title$],
$endif$

$if(runninghead)$
  runninghead: [$runninghead$],
$endif$

$if(by-author)$
  authors: (
    $for(by-author)$(
      name: [$it.name.literal$],
      corresponding: [
        $if(it.email)$
          #footnote[Corresponding author: $it.name.literal$, $it.email$.]
        $endif$
      ],
      affiliations: [
        $for(it.affiliations)$
          $if(it.id)$$it.id$$endif$$sep$, 
        $endfor$
      ],
      email: [$it.email$]
    ),
    $endfor$
  ),
$endif$

$if(affiliations)$
  affiliations: (
    $for(affiliations)$(
      id: [$it.id$],
      string: [$if(it.department)$$it.department$\ $endif$$it.name$]
    ),
    $endfor$
  ),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(region)$
  region: "$region$",
$endif$
$if(abstract)$
  abstract: [$abstract$],
$endif$
$if(keywords)$
  keywords: [$keywords$],
$endif$
$if(margin)$
  margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
$endif$
$if(papersize)$
  paper: "$papersize$",
$endif$
$if(mainfont)$
  font: ("$mainfont$",),
$endif$
$if(fontsize)$
  fontsize: $fontsize$,
$endif$
$if(section-numbering)$
  sectionnumbering: "$section-numbering$",
$endif$
$if(toc)$
  toc: $toc$,
$endif$
  cols: $if(columns)$$columns$$else$1$endif$,
  doc,
)

#show heading.where(
  level: 1
): it => block(width: 100%, below: 12pt)[
  #set align(center)
  #set text(1em, weight: "regular")
  #strong(it.body)
]

#show heading.where(
  level: 2
): it => block(width: 100%, below: 12pt)[
  #set align(left)
  #set text(1em, weight: "bold")
  #strong(it.body)
]

#show heading.where(
  level: 3
): it => block(width: 100%, below: 12pt)[
  #set align(left)
  #set text(1em, weight: "bold")
  #emph(it.body)
]

#show heading.where(
  level: 4
): it => text(
  size: 1em,
  weight: "bold",
  it.body + [.]
)

#show heading.where(
  level: 5
): it => text(
  size: 1em,
  weight: "bold",
  style: "italic",
  it.body + [.]
)
