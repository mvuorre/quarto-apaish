all: manuscript document journal

manuscript: example.qmd
	quarto render example.qmd --to apaish-manuscript-typst \
	--output example-manuscript.pdf

document: example.qmd
	quarto render example.qmd --to apaish-document-typst \
	--output example-document.pdf

journal: example.qmd
	quarto render example.qmd --to apaish-journal-typst \
	--output example-journal.pdf
