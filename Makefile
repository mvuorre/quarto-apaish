all: manuscript document journal

manuscript: example.qmd
	quarto render example.qmd --output example-manuscript.pdf
