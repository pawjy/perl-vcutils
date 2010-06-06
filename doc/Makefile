all: readme.en.html readme.ja.html

readme.en.html: readme.html.src
	harusame --lang en < $< > $@
readme.ja.html: readme.html.src
	harusame --lang ja < $< > $@

## License: Public Domain.
