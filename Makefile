SOURCE = example

all: man doc jou

man: $(SOURCE).qmd
	quarto render $< --to apaish-typst \
		--output $(SOURCE)-$@.pdf \
		-M documentmode:$@

doc: $(SOURCE).qmd
	quarto render $< --to apaish-typst \
		--output $(SOURCE)-$@.pdf \
		-M documentmode:$@

jou: $(SOURCE).qmd
	quarto render $< --to apaish-typst \
		--output $(SOURCE)-$@.pdf \
		-M documentmode:$@
