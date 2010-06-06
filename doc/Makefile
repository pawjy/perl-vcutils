all: readme.en.html readme.ja.html

readme.en.html: readme-src.html
	harusame --lang en < $< > $@
readme.ja.html: readme-src.html
	harusame --lang ja < $< > $@

## License: Public Domain.
