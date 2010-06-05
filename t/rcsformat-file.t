package test::RCSFormat::File;
use strict;
use warnings;
use Path::Class;
use lib file (__FILE__)->dir->parent->subdir ('lib')->stringify;
use Test::More;
use Test::Differences;
use base qw(Test::Class);
use RCSFormat::File;

my $test_f = file (__FILE__)->dir->subdir ('data')->file ('parser.cgi,v');

sub getrcs (;$) {
  return RCSFormat::File->new_from_stringref (\ scalar $test_f->slurp);
} # getrcs

sub _revisions_simple : Test(2) {
  my $rcs = getrcs;

  my $revs = $rcs->revisions;
  isa_ok $revs, 'List::Rubyish';

  eq_or_diff $revs->to_a, [qw(1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2 1.1)];
} # _revisions

sub _get_revision_by_number : Test(3) {
  my $rcs = getrcs;
  
  my $rev0 = $rcs->get_revision_by_number ('1.6.2');
  is $rev0, undef;

  my $rev1 = $rcs->get_revision_by_number ('1.9');
  isa_ok $rev1, 'RCSFormat::Revision';

  my $rev2 = $rcs->get_revision_by_number ('1.6');
  isa_ok $rev2, 'RCSFormat::Revision';
} # _get_revision_by_number

__PACKAGE__->runtests;

1;
