#
# Dirty makefile
#

EPSTOPDF=a2ping

figs-only=tri.fig
figs-texs=

# mpfigs=
#
# mpfigsbase=$(basename $(mpfigs))
# qtd=$(shell grep -c beginfig $(mpfigs))
# mpfigsqtd=$(shell seq -w 1 $(qtd))
# repeatbase=$(shell for i in $(mpfigsqtd); do echo $(shell echo $(mpfigsbase).); done)
# joined=$(join $(repeatbase),$(mpfigsqtd))


all: all-pdf all-eps

all-pdf: $(figs-only:.fig=.pdf) $(figs-texs:.fig=.pdf) $(figs-texs:.fig=.tex)
all-eps: $(figs-only:.fig=.eps) $(figs-texs:.fig=.eps) $(figs-texs:.fig=.tex)

#all-mps:

# $(joined): $(mpfigs)
# 	mpost $<
# 	for i in $(mpfigsqtd); do mv $(mpfigs:.mp=).$$i $(mpfigs:.mp=)-0$$i.eps; done
# 	for i in *.eps; do ln -s $$i `basename $$i eps`mps; done

# .1.mps .2.mps: $(joined)
# 	for i in $(mpfigsqtd); do mv $(mpfigs:.mp=).$$i $(mpfigs:.mp=)-0$$i.eps; done
# 	for i in *.eps; do ln -s $$i `basename $$i eps`mps; done

.fig.tex:
	fig2dev -L pstex_t -p figs/$(<:.fig=) $< > $@

.fig.eps:
	fig2dev -L pstex $< > $@

.fig.pdf:
	#fig2dev -L pstex $< | epstopdf --filter --outfile=$@
	fig2dev -L pstex $< | $(EPSTOPDF) - $@

.fig.gif:
	fig2dev -L gif $< > $@

.fig.png:
	fig2dev -L png $< > $@

# .mp.eps: mpfigs
# 	for i in $(shell seq -w 1 $(qtd)); do mv $($<:.mp=).$$i $($<:.mp=)-$$i.eps; done

# .mp.mps: mpfigs
# 	for i in $(mpfigsqtd); do mv $($<:.mp=).$$i $($<:.mp=)-$$i.eps; done
# 	for i in *.eps; do ln -s $$i $(shell basename $$i).mps; done

clean:
	rm -f *~ *.eps *.pdf *.tex *.bak *.dvi *.log *.mpx *.mps *.[1-9] *.[0-9]+


.SUFFIXES: .fig .tex .eps .pdf .mps
.PHONY: clean
