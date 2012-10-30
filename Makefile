# Running tests:
#     $ make test
# Install required Perl modules into ./local/
#     $ make pmb-install
# Update list of required Perl modules:
#     1. Edit config/perl/modules.txt
#     2. Run "make pmb-update"
#     3. Commit modified files

all:

# ------ Setup ------

GIT = git
WGET = wget
PERL = perl
PERL_VERSION = latest
PERL_PATH = $(abspath local/perlbrew/perls/perl-$(PERL_VERSION)/bin)
REMOTEDEV_HOST = 
REMOTEDEV_PERL_VERSION = $(PERL_VERSION)

PMB_PMTAR_REPO_URL = 
PMB_PMPP_REPO_URL = 

Makefile-setupenv: Makefile.setupenv
	$(MAKE) --makefile Makefile.setupenv setupenv-update \
	    SETUPENV_MIN_REVISION=20120334

Makefile.setupenv:
	$(WGET) -O $@ https://raw.github.com/wakaba/perl-setupenv/master/Makefile.setupenv

lperl lprove local-perl perl-version perl-exec \
pmb-update pmb-install \
generatepm: %: Makefile-setupenv
	$(MAKE) --makefile Makefile.setupenv $@ \
            REMOTEDEV_HOST=$(REMOTEDEV_HOST) \
            REMOTEDEV_PERL_VERSION=$(REMOTEDEV_PERL_VERSION) \
	    PMB_PMTAR_REPO_URL=$(PMB_PMTAR_REPO_URL) \
	    PMB_PMPP_REPO_URL=$(PMB_PMPP_REPO_URL)

git-submodules:
	$(GIT) submodule update --init

# ------ Test ------

PERL_ENV = PATH=$(PERL_PATH):$(PATH) PERL5LIB=$(shell cat config/perl/libs.txt)
PROVE = prove

test: test-deps safetest

test-deps: git-submodules pmb-install test-data

test-data:
	-cd t/data/git-hg && ln -s dot.git .git
	-diff --version

safetest:
	$(PERL_ENV) $(PROVE) t/**.t

always:
