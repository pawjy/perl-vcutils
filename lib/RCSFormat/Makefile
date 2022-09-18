P2H = ../../local/p2h

all: build

build: File.html Revision.html
	cd Converter && $(MAKE) build

%.html: %.pod $(P2H)
	$(P2H) vcutils $< > $@

## License: Public Domain.
