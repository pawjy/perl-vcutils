#!/bin/sh
echo "1..1"
rootdir=`dirname $0`/..
tempfile=`perl -MFile::Temp -e 'print File::Temp->new->filename'`

perl $rootdir/bin/gitlog2json.pl < $rootdir/t/data/git-log-formatraw.txt > $tempfile
#diff -u $tempfile $rootdir/t/data/git-log-formatraw.json
if diff -u $tempfile $rootdir/t/data/git-log-formatraw.json -q; then
  echo "ok 1"
else
  echo "not ok 1"
fi

rm $tempfile

# LICENSE
# 
# Copyright 2012 Wakaba <w@suika.fam.cx>.
# 
# This program is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.
