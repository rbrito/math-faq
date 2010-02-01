#
# quick'n'dirty Makefile made by Rogério Brito in 2000-01-31.
#
#
# TODO: make the whole thing a little better.
#

CHAPS = $(shell ls -1 mf-*.tex)
TEXT  = math-faq
SRCS  = $(TEXT).tex $(CHAPS)
DVI   = $(TEXT).dvi
PS    = $(TEXT).ps
PDF   = $(TEXT).pdf

$(DVI): $(SRCS)
	make -C figs all-eps
	latex $<

$(PS): $(DVI)
	dvips $(DVI) -o $(PS)

$(PDF): $(SRCS)
	make -C figs all-eps all-pdf
	pdflatex $<

clean:
	rm -f *.dvi *.ps *.ps.gz *.prn *.aux *.log *.bbl *.blg *~ *.toc *.idx \
	      *.ilg *.ind *.loa *.lof *.lot *.pdf *.out *.brf *ps_pages .DS_Store *.eps *.xdv

cleanall: clean
	-[ -d figs ] && make -C figs clean

# 2up: $(PS)
# 	psnup -2 $(PS) nup-$(PS)

# print: 2up
# 	imprimeps nup-$(PS)
# 	lpr *.prn

backup: clean
	cd ..; rm -f $(TEXT).tar.gz; tar zcvhf $(TEXT).tar.gz $(TEXT)

kludge: clean
	-make -C figs all-eps all-pdf
	latex $(TEXT)
#	makeindex -s estiloidx $(TEXT)
	bibtex $(TEXT)
	latex $(TEXT)
	latex $(TEXT)
	latex $(TEXT)
#	dvipdfm -p letter -f /etc/texmf/dvipdfm/cm-super-t1.map $(TEXT)
#	dvips -Pcm-super $(TEXT)
#	ps2pdf $(PS)
