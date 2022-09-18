P2H = ../local/p2h

all: build

build: RCSFormat.html
	cd RCSFormat && $(MAKE) build

%.html: %.pm $(P2H)
	$(P2H) "vcutils" $< > $@

## License: Public Domain.
