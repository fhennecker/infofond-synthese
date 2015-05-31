# thanks titouanc for this makefile I stole from you
.PHONY: all clean mrproper
FIGURES = $(shell grep '{.*.eps}' *.tex | cut -d '{' -f 2 | tr -d '}') 

all: main.pdf

figures: $(FIGURES)

clean:
	rm -f *.log *.aux *.toc *.out

mrproper: clean
	rm -f main.pdf

%.pdf: %.tex ${FIGURES}
	pdflatex $<
	pdflatex $<

fsa/%.eps: fsa/%.dot
	dot -Tps $< -o $@
