.PHONY: all clean mrproper

all: main.pdf

clean:
	rm -f *.log *.aux *.toc *.out

mrproper: clean
	rm -f main.pdf

%.pdf: %.tex
	pdflatex $<
	pdflatex $<