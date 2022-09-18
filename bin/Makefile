P2H = ../local/p2h

all: build

build: splitrcs.html knitmodule.html viewvclog2rcs.html rcs2atom.html

%.html: %.pl $(P2H)
	$(P2H) vcutils $< > $@

viewvclog2rcs.html: %.html: %.pod $(P2H)
	$(P2H) vcutils $< > $@

## License: Public Domain.
