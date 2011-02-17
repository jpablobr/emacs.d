# 'make elc' byte-compiles the main emacs lisp files
# 'make info' formats the documentation files, producing info files
# 'make dvi' formats the documentation files, producing dvi files
# 'make all' does both of these tasks				
#
# 'make infodvi' formats the documentation files, producing info and dvi files

EMACS=emacs

all: elc info dvi

elc:
	cd lisp; $(MAKE) EMACS=$(EMACS) all

info:
	cd texi; $(MAKE) EMACS=$(EMACS) info

dvi:
	cd texi; $(MAKE) EMACS=$(EMACS) dvi

infodvi:
	cd texi; $(MAKE) EMACS=$(EMACS) all

distclean:
	cd lisp; $(MAKE) distclean
	cd texi; $(MAKE) distclean

clean:
	cd lisp; $(MAKE) clean
	cd texi; $(MAKE) clean
