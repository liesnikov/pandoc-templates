all: open

.PHONY: open reset

pdf: main.pdf
tex: main.tex
reset: clean pdf

open: main.pdf
	xdg-open main.pdf &

main.pdf: main.md bib.bib Makefile
	pandoc --standalone main.md --bibliography bib.bib --pdf-engine=xelatex -o main.pdf

# main.pdf: main.tex Makefile
# 	latexmk -xelatex="xelatex -interaction=nonstopmode" -pdf -use-make main.tex
#

main.tex: main.md Makefile
	pandoc --standalone main.md --bibliography bib.bib --pdf-engine=xelatex -o main.tex

allclean: clean
	rm -f main.pdf main.tex

clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb *.pk *.bbl *.blg *.bcf *.dvi *.fdb_latexmk *.fls *.run.xml
