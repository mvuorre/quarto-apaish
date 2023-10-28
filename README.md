# APA7ish Quarto Typst PDF template

[Quarto](https://quarto.org) extension for creating APA7-ish (American Psychological Association style, 7th edition) manuscripts in PDF format via [Typst](https://typst.app/docs).

View the example documents at <https://github.com/mvuorre/quarto-apaish/releases/latest>: 

- [Manuscript](https://github.com/mvuorre/quarto-apaish/releases/latest/download/example-manuscript.pdf)

## Install

Use quarto-apaish in an existing Quarto project:

```bash
quarto add mvuorre/quarto-apaish
```

Then, in your manuscript's Quarto source document, add the following YAML

```
format: 
  quarto-apaish-typst: default
```

## Use

Quarto documents use YAML metadata to control the document output. See the [example .qmd file](https://github.com/mvuorre/quarto-apaish/blob/main/example.qmd) for examples.

### Tips

#### Reference list

To add a reference list using Typst's native citation engine, add

````
```{=typst} 
#bibliography("bibliography.bib", title: "References", style: "apa")
```
````

To the end (or where you think is appropriate in your manuscript.)

## Limitations

Typst, and its Quarto integration are in early beta and changes are to be expected. 

Typst has limited support for tables. A suggested workaround for anything but the most basic tables is to convert your tables to figures, either figuratively speaking or literally. An example of literally converting a table to a figure is shown in the example document.
