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
  ##
  ## Copyright Richard Tobin, HCRC July 2003.
  ## May be freely redistributed provided copyright notice is retained.

  my $testdata_d = $data_d->subdir ('cvsweb');
  my $log_f = $testdata_d->file ('xmlconf.xml');
  my $rcs = `perl $v2r_f --log-uri $log_f`;
  eq_or_diff $rcs, scalar $testdata_d->file ('xmlconf.xml,v')->slurp;
}

sub _cvsweb_freebsd : Test(1) {
  ## <http://cvsweb.netbsd.org/bsdweb.cgi/src/common/lib/libutil/snprintb.c>
  ##
  ## License: BSD

  my $testdata_d = $data_d->subdir ('cvsweb');
  my $log_f = $testdata_d->file ('snprintb.c');
  my $rcs = `perl $v2r_f --log-uri $log_f`;
  eq_or_diff $rcs, scalar $testdata_d->file ('snprintb.c,v')->slurp;
}

sub _viewcvs_0_9_2 : Test(1) {
  ## <http://suika.fam.cx/gate/cvs/messaging/manakai/lib/Message/Makefile>
  ##
  ## License: Public Domain.

  my $testdata_d = $data_d->subdir ('viewcvs');
  my $log_f = $testdata_d->file ('Makefile');
  my $rcs = `perl $v2r_f --log-uri $log_f --original-base-url http://suika.fam.cx/gate/cvs/*checkout*/messaging/manakai/lib/Message/Makefile`;
  eq_or_diff $rcs, scalar $testdata_d->file ('Makefile,v')->slurp;
}

sub _viewvc_1_0_5_sfjp : Test(1) {
  ## <http://sourceforge.jp/cvs/view/gikonavi/gikonavi/Gesture.pas?r1=1.9&view=log>
  ##
  ## From <http://sourceforge.jp/cvs/view/gikonavi/gikonavi/readme/readme.txt?revision=1.132&view=markup>:
  ## ------------------------------
  ## 著作権、改変&再配布(以下「二次配布」)について
  ## ------------------------------
  ## このソフトウェアは修正BSDスタイルライセンスです。
  ## LICENSEのみ、またはLICENSEとLICENSE-jpの両方を二次配布物に含め、
  ## 書かれている条件を承諾する限り、自由に二次配布を行う事が出来ます。
  ##
  ## ギコナビは2000年に(ヒ)さんの手によって生まれました。
  ## 本人が著作権を主張されないためここに記述します。

  my $testdata_d = $data_d->subdir ('viewvc');
  my $log_f = $testdata_d->file ('Gesture.pas');
  my $rcs = `perl $v2r_f --log-uri $log_f --original-base-url http://sourceforge.jp/cvs/view/gikonavi/gikonavi/Gesture.pas`;
  eq_or_diff $rcs, scalar $testdata_d->file ('Gesture.pas,v')->slurp;
}

sub _viewvc_xhtml : Test(1) {
  ## <http://suika.fam.cx/gate/cvs/melon/pub/suikawiki/script/Makefile.PL>
  ##
  ## License: Public Domain.

  my $testdata_d = $data_d->subdir ('viewvc');
  my $log_f = $testdata_d->file ('Makefile.PL');
  my $rcs = `perl $v2r_f --log-uri $log_f --original-base-url http://suika.fam.cx/gate/cvs/melon/pub/suikawiki/script/Makefile.PL`;
  eq_or_diff $rcs, scalar $testdata_d->file ('Makefile.PL,v')->slurp;
}

__PACKAGE__->runtests;

1;

=head1 LICENSE

Copyright 2010 Wakaba <w@suika.fam.cx>.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
