# APA7ish Quarto Typst PDF template

[Quarto](https://quarto.org) extension for creating APA7-ish (American Psychological Association style, 7th edition) manuscripts in PDF format via [Typst](https://typst.app/docs).

Three document modes (akin to man, doc, and jou [here](https://mirror.lyrahosting.com/CTAN/macros/latex/contrib/apa7/apa7.pdf)) are implemented. View the example documents at <https://github.com/mvuorre/quarto-apaish/releases/latest>: 

- [Manuscript](https://github.com/mvuorre/quarto-apaish/releases/latest/download/example-manuscript.pdf)
- [Document](https://github.com/mvuorre/quarto-apaish/releases/latest/download/example-document.pdf)
- [Journal](https://github.com/mvuorre/quarto-apaish/releases/latest/download/example-journal.pdf)

"Manuscript" is the horrid "double-spaced everything on its own page" kind of document, "document" aims to be a basic LaTeX kind of one-column document, whereas "journal" is a two-column document similar to papers published in APA journals.

## Install

Use quarto-apaish in an existing Quarto project:

```bash
quarto add mvuorre/quarto-apaish
```

## Use

In your manuscript's Quarto source document, add the following YAML

```yaml
format: apaish-manuscript-typst
```

This creates a "[manuscript]((https://github.com/mvuorre/quarto-apaish/releases/latest/download/example-manuscript.pdf))" PDF. To create a "[document](https://github.com/mvuorre/quarto-apaish/releases/latest/download/example-document.pdf)" PDF, specify

```yaml
format: apaish-document-typst
```

And to create a "[journal](https://github.com/mvuorre/quarto-apaish/releases/latest/download/example-journal.pdf)" PDF (for preprints etc), specify

```yaml
format: apaish-journal-typst
```

Quarto documents use YAML metadata to control the document output. See the [example .qmd file](https://github.com/mvuorre/quarto-apaish/blob/main/example.qmd) for examples.

### Tips

#### Reference list

To add a reference list using Typst's native citation engine, add

````
```{=typst} 
#bibliography("bibliography.bib", title: "References", style: "apa")
```
````

To the end (or where you think is appropriate in your manuscript.) If you want it on a separate page, add `#linebreak()` on a separate line above the `#bibliography()` function call.

#### Fonts

Feel free to use any system fonts, e.g.

```yaml
font: "Libertinus serif"
```

## Limitations

Typst, and its Quarto integration are in early beta and changes are to be expected. 

Typst has limited support for tables. A suggested workaround for anything but the most basic tables is to convert your tables to figures, either figuratively speaking or literally. An example of literally converting a table to a figure is shown in the example document.

You currently [cannot](https://github.com/typst/typst/issues/2360) show full-width content in two-column Typst documents, such as `apaish-journal-typst`. So I guess try to make your figures small in journal mode 🤷
