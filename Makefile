all: manuscript

manuscript: example.qmd
	quarto render example.qmd --to apaish-typst --output example-manuscript.pdf
