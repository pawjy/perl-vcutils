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
my $test_1_1_f = $data_d->file ('parser.cgi.1.1');
my $test_1_6_f = $data_d->file ('parser.cgi.1.6');
my $test_1_7_f = $data_d->file ('parser.cgi.1.7');
my $test_1_8_f = $data_d->file ('parser.cgi.1.8');
my $test_1_9_f = $data_d->file ('parser.cgi.1.9');
my $test2_f = file (__FILE__)->dir->subdir ('data')->file ('wiki.cgi,v');
my $test3_f = file (__FILE__)->dir->subdir ('data')->file ('ChangeLog,v');

sub getrcs (;$) {
  if ($_[0] and $_[0] == 2) {
    return RCSFormat::File->new_from_stringref (\ scalar $test2_f->slurp);
  } elsif ($_[0] and $_[0] == 3) {
    return RCSFormat::File->new_from_stringref (\ scalar $test3_f->slurp);
  } else {
    return RCSFormat::File->new_from_stringref (\ scalar $test_f->slurp);
  }
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

sub _author : Test(2) {
  my $rcs = getrcs 2;
  
  my $rev = $rcs->get_revision_by_number ('1.7');
  is $rev->author, 'wakaba';
  
  my $rev2 = $rcs->get_revision_by_number ('1.58.6.1');
  is $rev2->author, 'hero';
} # _date

sub _log : Test(2) {
  my $rcs = getrcs 2;
  
  my $rev = $rcs->get_revision_by_number ('1.7');
  eq_or_diff $rev->log, qq[*** empty log message ***\n];
  
  my $rev2 = $rcs->get_revision_by_number ('1.27');
  eq_or_diff $rev2->log, qq[2002-10-07  Wakaba <w\@suika.fam.cx>\x0D\x0A\x0D\x0A\t* wiki.cgi:\x0D\x0A\t- Output Last-Modified:.\x0D\x0A\t- Record and output referer information.\x0A];
} # _log

sub _rawdata_last_revision : Test(1) {
  my $rcs = getrcs;

  my $rev1 = $rcs->get_revision_by_number ('1.9');
  my $rawdata1 = $rev1->rawdata;
  $rawdata1 =~ s[\$Date: 2007/08/11 13:54:55 \$][\$Date: 2007/11/11 04:18:27 \$];
  is_f_content $rawdata1, $test_1_9_f;
} # _rawdata_last_revision

sub _rawdata_old_revision : Test(1) {
  my $rcs = getrcs;

  my $rev2 = $rcs->get_revision_by_number ('1.6');
  my $rawdata2 = $rev2->rawdata;
  is $rawdata2, q[d33 1
d81 5
d164 1
a164 1
## $Date: 2007/05/25 14:24:31 $
];
} # _rawdata

sub _data_last_revision : Test(2) {
  my $rcs = getrcs;

  my $rev1 = $rcs->get_revision_by_number ('1.9');
  is_f_content $rev1->data, $test_1_9_f;
  is_f_content $rev1->data, $test_1_9_f;
} # _data_last_revision

sub _data_old_revision : Test(6) {
  my $rcs = getrcs;
  
  my $rev1 = $rcs->get_revision_by_number (1.8);
  is_f_content $rev1->data, $test_1_8_f;
  is_f_content $rev1->data, $test_1_8_f;
  
  my $rev3 = $rcs->get_revision_by_number (1.6);
  is_f_content $rev3->data, $test_1_6_f;
  is_f_content $rev3->data, $test_1_6_f;
  
  my $rev2 = $rcs->get_revision_by_number (1.7);
  is_f_content $rev2->data, $test_1_7_f;
  
  my $rev4 = $rcs->get_revision_by_number (1.1);
  is_f_content $rev4->data, $test_1_1_f;
} # _data_old_revision

sub _replace_keywords : Test(1) {
  my $rcs = getrcs;
  my $rev = $rcs->get_revision_by_number ('1.3');
  my $s1 = q[$Revision: 1.2 $abc Revision: 1.5 $];
  $rev->_replace_keywords ($s1);
  is $s1, q[$Revision: 1.3 $abc Revision: 1.5 $];
} # _replace_keywords

__PACKAGE__->runtests;

1;
