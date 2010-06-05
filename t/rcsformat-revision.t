package test::RCSFormat::File;
use strict;
use warnings;
use Path::Class;
use lib file (__FILE__)->dir->parent->subdir ('lib')->stringify;
use Test::More;
use Test::Differences;
use base qw(Test::Class);
use RCSFormat::File;

my $data_d = file (__FILE__)->dir->subdir ('data');
my $test_f = $data_d->file ('parser.cgi,v');
my $test_1_6_f = $data_d->file ('parser.cgi.1.6');
my $test_1_9_f = $data_d->file ('parser.cgi.1.9');

sub getrcs (;$) {
  return RCSFormat::File->new_from_stringref (\ scalar $test_f->slurp);
} # getrcs

sub is_f_content ($$;$) {
  eq_or_diff $_[0], scalar $_[1]->slurp, $_[2];
} # is_f_content

sub _date : Test(2) {
  my $rcs = getrcs;
  my $rev = $rcs->get_revision_by_number ('1.7');

  is $rev->rawdate, '2007.05.28.14.04.57';
  is $rev->date_as_epoch, '1180361097';
} # _date

sub _rawdata : Test(2) {
  my $rcs = getrcs;

  my $rev1 = $rcs->get_revision_by_number ('1.9');
  my $rawdata1 = $rev1->rawdata;
  $rawdata1 =~ s[\$Date: 2007/08/11 13:54:55 \$][\$Date: 2007/11/11 04:18:27 \$];
  is_f_content $rawdata1, $test_1_9_f;

  my $rev2 = $rcs->get_revision_by_number ('1.6');
  my $rawdata2 = $rev2->rawdata;
  is $rawdata2, q[d33 1
d81 5
d164 1
a164 1
## $Date: 2007/05/25 14:24:31 $
];
} # _rawdata

__PACKAGE__->runtests;

1;
