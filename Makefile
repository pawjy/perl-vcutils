
all:

WGET = wget
CURL = curl
GIT = git

updatenightly: local/bin/pmbp.pl
	$(CURL) -s -S -L -f https://gist.githubusercontent.com/wakaba/34a71d3137a52abb562d/raw/gistfile1.txt | sh
	$(GIT) add modules t_deps/modules
	perl local/bin/pmbp.pl --update
	$(GIT) add config
	$(CURL) -sSLf https://raw.githubusercontent.com/wakaba/ciconfig/master/ciconfig | RUN_GIT=1 REMOVE_UNUSED=1 perl

## ------ Setup ------

deps: git-submodules pmbp-install

git-submodules:
	$(GIT) submodule update --init

PMBP_OPTIONS=

local/bin/pmbp.pl:
	mkdir -p local/bin
	$(CURL) -s -S -L -f https://raw.githubusercontent.com/wakaba/perl-setupenv/master/bin/pmbp.pl > $@
pmbp-upgrade: local/bin/pmbp.pl
	perl local/bin/pmbp.pl $(PMBP_OPTIONS) --update-pmbp-pl
pmbp-update: git-submodules pmbp-upgrade
	perl local/bin/pmbp.pl $(PMBP_OPTIONS) --update
pmbp-install: pmbp-upgrade
	perl local/bin/pmbp.pl $(PMBP_OPTIONS) --install \
            --create-perl-command-shortcut @perl \
            --create-perl-command-shortcut @prove

P2H = local/p2h
HARUSAME = local/harusame

$(HARUSAME):
	$(CURL) -sSLf https://raw.githubusercontent.com/wakaba/harusame/master/harusame > $@
	chmod u+x $@

build: $(P2H) $(HARUSAME) build-main

build-main:
	cd bin && $(MAKE) build
	cd doc && $(MAKE) build
	cd lib && $(MAKE) build

$(P2H): local
	$(CURL) -sSfL https://raw.githubusercontent.com/manakai/manakai.github.io/master/p2h > $@
	chmod u+x $@

local:
	mkdir -p local

## ------ Tests ------

PROVE = ./prove

test: test-deps test-main

test-deps: deps test-data

test-data:
	-cd t/data/git-hg && ln -s dot.git .git
	-diff --version

test-main:
	$(PROVE) t/*.t

## License: Public Domain.
