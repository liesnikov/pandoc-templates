all: nix

.PHONY: open reset pdf tex

nix: result/main.pdf
pdf: main.pdf
tex: main.tex
reset: clean pdf

open: main.pdf
	xdg-open main.pdf &

result/main.pdf: main.md bib.bib Makefile
	nix-build . ""

main.pdf: main.md bib.bib Makefile
	pandoc --standalone main.md --citeproc --bibliography bib.bib --pdf-engine=xelatex -o main.pdf

main.tex: main.md Makefile
	pandoc --standalone main.md --citeproc --bibliography bib.bib --pdf-engine=xelatex -o main.tex

# main.pdf: main.tex Makefile
# 	latexmk -xelatex="xelatex -interaction=nonstopmode" -pdf -use-make main.tex
#

allclean: clean
	rm -f main.pdf main.tex
	rm -rf result

clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.vrb *.pk *.bbl *.blg *.bcf *.dvi *.fdb_latexmk *.fls *.run.xml
