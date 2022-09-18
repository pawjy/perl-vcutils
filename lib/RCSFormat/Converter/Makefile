P2H = ../../../local/p2h

all: build

build: Atom.html

%.html: %.pod $(P2H)
	$(P2H) vcutils $< > $@

## License: Public Domain.
