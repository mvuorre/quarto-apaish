// Map YAML options from .qmd source to Typst template

#show: doc => article(

$if(title)$
  title: [$title$],
$endif$

$if(running-head)$
  running-head: [$running-head$],
$endif$

$if(authornote)$
  authornote: [$authornote$],
$endif$

$if(by-author)$
  authors: (
    $for(by-author)$(
      name: [$it.name.literal$],
      corresponding: [
        $if(it.email)$
          #footnote(numbering: "a")[Corresponding author: $it.name.literal$, $it.email$.\ $authornote$]
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

$if(font)$
  font: ("$font$",),
$endif$

$if(fontsize)$
  fontsize: $fontsize$,
$endif$

$if(leading)$
  leading: $leading$,
  spacing: $leading$,
$endif$

$if(spacing)$
  spacing: $spacing$,
$endif$

$if(section-numbering)$
  section-numbering: "$section-numbering$",
$endif$

$if(toc)$
  toc: $toc$,
$endif$
cols: $if(columns)$$columns$$else$1$endif$,
  doc,
)
