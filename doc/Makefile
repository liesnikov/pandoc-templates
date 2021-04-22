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
# 	latexmk -xelatex="xelatex -interaction=nonstopmode" -use-make main.tex
#

main.tex: main.md Makefile
	pandoc --standalone main.md --bibliography bib.bib --pdf-engine=xelatex -o main.tex

allclean:
	rm -f main.bbl main.aux main.log main.out main.pdf main.run.xml main.tex main.bcf main.blg main.toc
