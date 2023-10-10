# APA7ish Quarto templates

[Quarto](https://quarto.org) extension for creating APA7-ish (American Psychological Association style, 7th edition) manuscripts.

Currently has templates for:

- PDF output ([Typst](https://typst.app/docs)): [example PDF](template.pdf)

## Installing

Use quarto-apaish in an existing Quarto project (recommended)

```bash
quarto add mvuorre/quarto-apaish
```

Create a new Quarto project using quarto-apaish (confusing)

```bash
quarto use template mvuorre/quarto-apaish
```

## Use

Quarto documents use YAML metadata to control the document output. Below is a list of useful YAML fields for quarto-apaish. (See [here](template.qmd) for the complete YAML metadata of the example document.)

To create a running head on pages 2->

```yaml
runninghead: APA7ish
```

Add `email` to the author you'd like to designate as the corresponding author

```yaml
author:
  - name: Norah Jones
    email: sm@example.org
    affiliation:
      - ref: a
      - ref: b
  - name: John Hamm
    affiliation:
      - ref: a
```

Use the `author: affiliation` & `affiliations: id` syntax to link (multiple) authors to (multiple) institutions

```yaml
affiliations:
  - id: a
    name: University A
  - id: b
    name: University B
    department: Some department
```

The optional fields `abstract`, `keywords`, `date`, and `authornote` add basic info to your document

```yaml
abstract: |
  This document is a template demonstrating the Apaish format. This document is a template demonstrating the Apaish format. This document is a template demonstrating the Apaish format. This document is a template demonstrating the Apaish format. This document is a template demonstrating the Apaish format. This document is a template demonstrating the Apaish format. This document is a template demonstrating the Apaish format. This document is a template demonstrating the Apaish format.

keywords: "Quarto, template, APA, Typst, PDF"
date: 2023-10-10
authornote: |
  Can include info here, like "This pre-print is not yet peer-reviewed."
```

Reference information

```yaml
bibliography: bibliography.bib  
csl: apa.csl
citeproc: true
```

Here is an incomplete list of additional options you can use to control the look and feel of the document

```yaml
format:
  quarto-apaish-typst: 
    toc: false
    columns: 2
    fontsize: 10pt
    papersize: a4
    mainfont: Libertinus
    section-numbering: ""
```
