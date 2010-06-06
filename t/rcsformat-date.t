package test::RCSFormat::Date;
use strict;
use warnings;
use Path::Class;
use lib file (__FILE__)->dir->parent->subdir ('lib')->stringify;
use Test::More;
use base qw(Test::Class);
use RCSFormat::Date;

sub _rcsdate_to_epoch : Test(7) {
  for (
    [undef, 0],
    ['', 0],
    [0, 0],
    ['2010.01.01.02.06.10', 1262311570],
    ['1970.01.01.02.06.10', 7570],
    ['1970-01-01T02:06:10', 0],
    ['abc', 0],
  ) {
    is rcsdate_to_epoch $_->[0] => $_->[1];
  }
} # _rcsdate_to_epoch

sub _epoch_to_rcsdate : Test(14) {
  for (
    [undef,                 '1970.01.01.00.00.00', '1970/01/01 00:00:00'],
    ['',                    '1970.01.01.00.00.00', '1970/01/01 00:00:00'],
    [7570,                  '1970.01.01.02.06.10', '1970/01/01 02:06:10'],
    [1262311570,            '2010.01.01.02.06.10', '2010/01/01 02:06:10'],
    [2001,                  '1970.01.01.00.33.21', '1970/01/01 00:33:21'],
    ['2001.02.04.11.01.23', '1970.01.01.00.33.21', '1970/01/01 00:33:21'],
    ['abc',                 '1970.01.01.00.00.00', '1970/01/01 00:00:00'],
  ) {
    is epoch_to_rcsdate $_->[0] => $_->[1];
    is epoch_to_rcs_formatted_date $_->[0] => $_->[2];
  }
} # _epoch_to_rcsdate

__PACKAGE__->runtests;

1;

=head1 LICENSE

Copyright 2010 Wakaba <w@suika.fam.cx>.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
