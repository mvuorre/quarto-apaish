# APA7ish Quarto Typst PDF template

[Quarto](https://quarto.org) extension for creating APA7-ish (American Psychological Association style, 7th edition) manuscripts in PDF format via [Typst](https://typst.app/docs).

View the example documents at <https://github.com/mvuorre/quarto-apaish/releases/latest>:

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