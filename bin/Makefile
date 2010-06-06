POD2HTML = pod2html --css "http://suika.fam.cx/www/style/html/pod.css" \
  --htmlroot "../lib/"

all: splitrcs.html knitmodule.html viewvclog2rcs.html rcs2atom.html

%.html: %.pl
	$(POD2HTML) $< > $@

viewvclog2rcs.html: %.html: %.pod
	$(POD2HTML) $< > $@

## License: Public Domain.
