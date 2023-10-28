// Map YAML options from .qmd source to Typst template

#show: doc => article(

$if(title)$
  title: [$title$],
$endif$

$if(running-head)$
  running-head: [$running-head$],
$endif$

$if(by-author)$
  authors: (
    $for(by-author)$(
      name: [$it.name.literal$],
      affiliations: [
        $for(it.affiliations)$
          $if(it.id)$$it.id$$endif$$sep$,
        $endfor$
      ],
      corresponding: [$it.corresponding$],
      email: [$it.email$]
    ),
    $endfor$
  ),
$endif$

$if(affiliations)$
  affiliations: (
    $for(affiliations)$(
      id: [$it.id$],
      string: [$if(it.department)$$it.department$, $endif$$it.name$]
    ),
    $endfor$
  ),
$endif$

$if(authornote)$
  authornote: [$authornote$],
$endif$

$if(abstract)$
  abstract: [$abstract$],
$endif$

$if(keywords)$
  keywords: [$keywords$],
$endif$

$if(paper)$
  paper: "$paper$",
$endif$

$if(mode)$
  mode: "$mode$",
$endif$

$if(margin)$
  margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
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
  leading: $leading$
$endif$
$if(cols)$
  cols: $cols$,
$endif$
  
  doc,
)
