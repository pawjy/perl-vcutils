package test::bin::viewvclog2rcs;
use strict;
use warnings;
use Path::Class;
use base qw(Test::Class);
use Test::More;
use Test::Differences;

my $v2r_f = file (__FILE__)->dir->parent->subdir ('bin')->file ('viewvclog2rcs.pl');
my $data_d = file (__FILE__)->dir->subdir ('data');

sub _cvsweb_w3c : Test(1) {
  ## <http://dev.w3.org/cvsweb/2001/XML-Test-Suite/xmlconf/eduni/errata-2e/xmlconf.xml>

  my $testdata_d = $data_d->subdir ('cvsweb');
  my $log_f = $testdata_d->file ('xmlconf.xml');
  my $rcs = `perl $v2r_f --log-uri $log_f`;
  eq_or_diff $rcs, scalar $testdata_d->file ('xmlconf.xml,v')->slurp;
}

sub _cvsweb_freebsd : Test(1) {
  ## <http://cvsweb.netbsd.org/bsdweb.cgi/src/common/lib/libutil/snprintb.c>

  my $testdata_d = $data_d->subdir ('cvsweb');
  my $log_f = $testdata_d->file ('snprintb.c');
  my $rcs = `perl $v2r_f --log-uri $log_f`;
  eq_or_diff $rcs, scalar $testdata_d->file ('snprintb.c,v')->slurp;
}

sub _viewcvs_0_9_2 : Test(1) {
  ## <http://suika.fam.cx/gate/cvs/messaging/manakai/lib/Message/Makefile>

  my $testdata_d = $data_d->subdir ('viewcvs');
  my $log_f = $testdata_d->file ('Makefile');
  my $rcs = `perl $v2r_f --log-uri $log_f --original-base-url http://suika.fam.cx/gate/cvs/*checkout*/messaging/manakai/lib/Message/Makefile`;
  eq_or_diff $rcs, scalar $testdata_d->file ('Makefile,v')->slurp;
}

sub _viewvc_xhtml : Test(1) {
  ## <http://suika.fam.cx/gate/cvs/melon/pub/suikawiki/script/Makefile.PL>

  my $testdata_d = $data_d->subdir ('viewvc');
  my $log_f = $testdata_d->file ('Makefile.PL');
  my $rcs = `perl $v2r_f --log-uri $log_f --original-base-url http://suika.fam.cx/gate/cvs/melon/pub/suikawiki/script/Makefile.PL`;
  eq_or_diff $rcs, scalar $testdata_d->file ('Makefile.PL,v')->slurp;
}

__PACKAGE__->runtests;

1;
