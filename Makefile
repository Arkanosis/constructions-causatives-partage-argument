# Filename
# Use basenawe without file extension
FILENAME=fs

DEPS_BIB=$(shell cat $(FILENAME).tex | \
	 sed -ne /bibliography{/p | sed -e s/.*{// | sed -e s/}.*/.bib/)
DEPS_TEX=$(shell cat $(FILENAME).tex | \
	 sed -ne /include{/p | sed -e s/.*{// | sed -e s/}.*/.tex/)

TEXI2PDF=texi2pdf

pdf: $(FILENAME).pdf

%.pdf: %.tex $(DEPS_BIB) $(DEPS_TEX) *.tex
	$(TEXI2PDF) --tidy $<

clean:
	$(TEXI2PDF) --mostly-clean $(FILENAME).tex

distclean: clean
	rm -f $(FILENAME).pdf

