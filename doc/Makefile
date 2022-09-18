all: build

HARUSAME = ../local/harusame

build: readme.en.html readme.ja.html

readme.en.html: readme.html.src $(HARUSAME)
	$(HARUSAME) --lang en < $< > $@
readme.ja.html: readme.html.src $(HARUSAME)
	$(HARUSAME) --lang ja < $< > $@

## License: Public Domain.
