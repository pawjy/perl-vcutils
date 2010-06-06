package test::RCSFormat::Diff;
use strict;
use warnings;
use Path::Class;
use lib file (__FILE__)->dir->parent->subdir ('lib')->stringify;
use Test::More;
use Test::Differences;
use base qw(Test::Class);
use RCSFormat::Diff;
use RCSFormat::File;

my $data_d = file (__FILE__)->dir->subdir ('data');
my $test_f = $data_d->file ('parser.cgi,v');
my $test_1_8_f = $data_d->file ('parser.cgi.1.8');
my $test_1_7_f = $data_d->file ('parser.cgi.1.7');

sub getrcs (;$) {
  return RCSFormat::File->new_from_stringref (\ scalar $test_f->slurp);
} # getrcs

sub is_f_content ($$;$) {
  eq_or_diff $_[0], scalar $_[1]->slurp, $_[2];
} # is_f_content

sub _parse_1 : Test(1) {
  my $rcs = getrcs;

  my $rev2 = $rcs->get_revision_by_number ('1.6');
  my $rawdata2 = $rev2->rawdata;

  my $parsed = parse_rcs_diff (\$rawdata2);
  eq_or_diff $parsed, [
    [
      [164, 26, 58],
    ],
    [
      [33, 1],
      [81, 5],
      [164, 1],
    ],
  ];
} # _parse_1

sub _apply_1 : Test(2) {
  my $rcs = getrcs;

  my $rev1 = $rcs->get_revision_by_number ('1.9');
  my $data1 = $rev1->data;

  my $rev2 = $rcs->get_revision_by_number ('1.8');
  my $diff2 = $rev2->rawdata;

  apply_rcs_diff \$data1, \$diff2;

  $data1 =~ s{\$Date: 2007/05/28 14:04:57 \$}
      {\$Date: 2007/08/11 13:54:55 \$};

  is_f_content $data1, $test_1_8_f;

  my $rev3 = $rcs->get_revision_by_number ('1.7');
  my $diff3 = $rev3->rawdata;

  apply_rcs_diff \$data1, \$diff3;

  $data1 =~ s{\$Date: 2007/05/27 11:16:02 \$}
      {\$Date: 2007/05/28 14:04:57 \$};

  is_f_content $data1, $test_1_7_f;
} # _apply_1

__PACKAGE__->runtests;

1;

=head1 LICENSE

Copyright 2010 Wakaba <w@suika.fam.cx>.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
