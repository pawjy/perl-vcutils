POD2HTML = pod2html --css "http://suika.fam.cx/www/style/html/pod.css" \
  --htmlroot "."

all: RCSFormat.html

%.html: %.pm
	$(POD2HTML) $< > $@

## License: Public Domain.
