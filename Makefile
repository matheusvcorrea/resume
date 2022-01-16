LATEXMK = latexmk -use-make -xelatex -pdfxe -shell-escape \
	-recorder \
	-e '$$latex="latex -interaction=nonstopmode %O %S"' \
	-e '$$pdflatex="pdflatex -interaction=nonstopmode %O %S"' 

TEXs = $(wildcard *.tex)
PDFs = $(subst .tex,.pdf,$(TEXs))

.PHONY: default
default: $(PDFs)

.PHONY: all
all: clean pdf

.PHONY: pdf
pdf: $(PDFs)

$(PDFs): %.pdf : %.tex
	$(LATEXMK) $<

.PHONY: clean
clean ::
	$(LATEXMK) -e '$$clean_full_ext = "bbl pdfsync nav snm vrb out.ps synctex.gz"' -C
