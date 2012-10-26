#!/bin/sh
echo "1..2"

dir=$(perl -e "
use strict;
use warnings;
use Path::Class;
use lib glob file(__FILE__)->dir->parent->subdir('t_deps', 'modules', '*', 'lib')->stringify;
use Test::Git::EditRepository;

print create_git_repository;
")

(ls $dir 2> /dev/null && echo "not ok 1") || echo "ok 1"

dir=$(perl -e "
use strict;
use warnings;
use Path::Class;
use lib glob file(__FILE__)->dir->parent->subdir('t_deps', 'modules', '*', 'lib')->stringify;
use Test::Git::EditRepository;

print create_git_repository->parent->resolve;
")

(ls $dir 2> /dev/null && echo "not ok 2") || echo "ok 2"
