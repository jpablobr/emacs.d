# 'make all' byte-compiles all of the el files
EMACS = emacs
RM = rm -f
FLAGS = -batch -l docomp.el -f batch-byte-compile 

SOURCES = aucify.el light.el ultex.el ultex-setup.el ultex-cus.el

all:    most

most: 
	$(EMACS) $(FLAGS) $(SOURCES)

clean:
	$(RM) *.elc *~

distclean: clean
