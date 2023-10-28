# APA7ish Quarto Typst PDF template

[Quarto](https://quarto.org) extension for creating APA7-ish (American Psychological Association style, 7th edition) manuscripts in PDF format via [Typst](https://typst.app/docs).

View the example documents at <https://github.com/mvuorre/quarto-apaish/releases/latest>:
- https://github.com/mvuorre/quarto-apaish/releases/latest/download/example-manuscript.pdf

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

Quarto documents use YAML metadata to control the document output. Below is a list of useful YAML fields for quarto-apaish. See the [example .qmd file](https://github.com/mvuorre/quarto-apaish/blob/main/example.qmd) for examples.

### Tips

#### Bibliography

quarto-apaish uses Typst native citations. Add the following to your `.qmd` file where you want the reference list to appear (remove `#pagebreak()` to show references without a page break).

````
```{=typst} 
#pagebreak()
#bibliography("bibliography.bib", title: "References", style: "apa")
```
````

#### Appendices

If you want to include things after the references, e.g. an appendix, you can use e.g.

````
```{=typst} 
#pagebreak()
```
# Appendices
Appendix content.
````

## Develop / contribute

Please send bug reports and suggestions as github issues, contributions as pull requests ✨.

APA7 reference is at <https://apastyle.apa.org/style-grammar-guidelines/paper-format>. 
