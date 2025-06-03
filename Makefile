FILES_M=kit-is-m.sty thesis.tex
FILES_COMMON=kit-is.bst sample.bib
FIGS=coverpage.pdf

LATEXCMD=platex
BIBTEXCMD=pbibtex

all: thesis.pdf

clean:
	rm -f *.dvi *.aux *.toc *.log *.bbl *.blg *~ *.bak

thesis.dvi: $(FILES_M) $(FILES_COMMON) $(FIGS)
	$(LATEXCMD) thesis.tex
	$(BIBTEXCMD) thesis
	$(LATEXCMD) thesis.tex
	$(LATEXCMD) thesis.tex

thesis.pdf: thesis.dvi
	dvipdfmx thesis.dvi

