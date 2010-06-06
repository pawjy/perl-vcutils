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
my $test_f_diff = file (__FILE__)->dir->subdir ('data')->file ('parser.cgi.diff-1.5-1.6');
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

sub _revisions_simple : Test(4) {
  my $rcs = getrcs;

  my $revs = $rcs->revision_numbers;
  isa_ok $revs, 'List::Rubyish';

  eq_or_diff $revs->to_a, [qw(1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2 1.1)];

  my $revs2 = $rcs->revision_numbers_sorted_by_date;
  isa_ok $revs2, 'List::Rubyish';

  eq_or_diff $revs2->to_a, [qw(1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2 1.1)];
} # _revisions_simple

sub _revisions_branched : Test(4) {
  my $rcs = getrcs 2;

  my $revs = $rcs->revision_numbers;
  isa_ok $revs, 'List::Rubyish';

  eq_or_diff $revs->to_a, [qw(
    1.61
    1.60 1.59 1.58 1.57 1.56 1.55 1.54 1.53 1.52 1.51
    1.50 1.49 1.48 1.47 1.46 1.45 1.44 1.43 1.42 1.41
    1.40 1.39 1.38 1.37 1.36 1.35 1.34 1.33 1.32 1.31
    1.30 1.29 1.28 1.27 1.26 1.25 1.24 1.23 1.22 1.21
    1.20 1.19 1.18 1.17 1.16 1.15 1.14 1.13 1.12 1.11
    1.10 1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2 1.1
    1.58.6.1 1.58.8.1
    1.54.2.1
    1.1.1.1
  )];

  my $revs2 = $rcs->revision_numbers_sorted_by_date;
  isa_ok $revs2, 'List::Rubyish';
  eq_or_diff $revs2->to_a, [qw(
    1.58.8.1
    1.58.6.1
    1.61
    1.60 1.59 1.58 1.57 1.56 1.55
    1.54.2.1
    1.54 1.53 1.52 1.51
    1.50 1.49 1.48 1.47 1.46 1.45 1.44 1.43 1.42 1.41
    1.40 1.39 1.38 1.37 1.36 1.35 1.34 1.33 1.32 1.31
    1.30 1.29 1.28 1.27 1.26 1.25 1.24 1.23 1.22 1.21
    1.20 1.19 1.18 1.17 1.16
    1.1.1.1
    1.15 1.14 1.13 1.12 1.11
    1.10 1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2 1.1
  )];
} # _revisions_branched

sub _revisions_branched_2 : Test(4) {
  my $rcs = getrcs 3;

  my $revs = $rcs->revision_numbers;
  isa_ok $revs, 'List::Rubyish';

  eq_or_diff $revs->to_a, [qw(
    1.45 1.44 1.43 1.42 1.41
    1.40 1.39 1.38 1.37 1.36 1.35 1.34 1.33 1.32 1.31
    1.30 1.29 1.28 1.27 1.26 1.25 1.24 1.23 1.22 1.21
    1.20 1.19 1.18 1.17 1.16 1.15 1.14 1.13 1.12 1.11
    1.10 1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2 1.1
    1.34.2.1 1.34.2.2
  )];

  my $revs2 = $rcs->revision_numbers_sorted_by_date;
  isa_ok $revs2, 'List::Rubyish';
  eq_or_diff $revs2->to_a, [qw(
    1.45 1.44
    1.34.2.2
    1.43 1.42 1.41
    1.40 1.39 1.38 1.37 1.36 1.35
    1.34.2.1
    1.34 1.33 1.32 1.31
    1.30 1.29 1.28 1.27 1.26 1.25 1.24 1.23 1.22 1.21
    1.20 1.19 1.18 1.17 1.16 1.15 1.14 1.13 1.12 1.11
    1.10 1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2 1.1
  )];
} # _revisions_branched_2

sub _get_revision_by_number : Test(3) {
  my $rcs = getrcs;
  
  my $rev0 = $rcs->get_revision_by_number ('1.6.2');
  is $rev0, undef;

  my $rev1 = $rcs->get_revision_by_number ('1.9');
  isa_ok $rev1, 'RCSFormat::Revision';

  my $rev2 = $rcs->get_revision_by_number ('1.6');
  isa_ok $rev2, 'RCSFormat::Revision';
} # _get_revision_by_number

sub _find_route_1 : Test(8) {
  my $rcs = getrcs;

  eq_or_diff $rcs->find_route_to_revision ('1.9'),
      [qw(1.9)];
  eq_or_diff $rcs->find_route_to_revision ('1.8'),
      [qw(1.9 1.8)];
  eq_or_diff $rcs->find_route_to_revision ('1.3'),
      [qw(1.9 1.8 1.7 1.6 1.5 1.4 1.3)];
  eq_or_diff $rcs->find_route_to_revision ('1.1'),
      [qw(1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2 1.1)];
  eq_or_diff $rcs->find_route_to_revision ('1.10'), [];
  eq_or_diff $rcs->find_route_to_revision ('1.0'), [];
  eq_or_diff $rcs->find_route_to_revision ('abc'), [];
  eq_or_diff $rcs->find_route_to_revision ('1.9.3'), [];
} # _find_route_1

sub _find_route_2 : Test(3) {
  my $rcs = getrcs 2;

  eq_or_diff $rcs->find_route_to_revision ('1.30'),
      [qw(
        1.61 1.60 1.59 1.58 1.57 1.56 1.55 1.54 1.53 1.52 1.51 1.50 1.49
        1.48 1.47 1.46
        1.45 1.44 1.43 1.42 1.41 1.40 1.39 1.38 1.37 1.36 1.35 1.34 1.33
        1.32 1.31 1.30
      )];
  eq_or_diff $rcs->find_route_to_revision ('1.54.2.1'),
      [qw(
        1.61 1.60 1.59 1.58 1.57 1.56 1.55 1.54 1.54.2.1
      )];
  eq_or_diff $rcs->find_route_to_revision ('1.54.2'), [];
} # _find_route_2

sub _find_route_3 : Test(3) {
  my $rcs = getrcs 3;

  eq_or_diff $rcs->find_route_to_revision ('1.34.2.2'),
      [qw(
        1.45 1.44 1.43 1.42 1.41 1.40 1.39 1.38 1.37 1.36 1.35 1.34
        1.34.2.1 1.34.2.2
      )];
  eq_or_diff $rcs->find_route_to_revision ('1.34.0.2'), [];
  eq_or_diff $rcs->find_route_to_revision ('1.34.2.3'), [];
} # _find_route_3

sub _unified_diff : Test(2) {
  my $rcs = getrcs;
  $rcs->file_name ('parser.cgi');

  my $diff = $rcs->get_unified_diff_by_numbers (1.5, 1.6);
  is_f_content $diff, $test_f_diff;

  my $diff2 = $rcs->get_unified_diff_by_numbers (30.2, 1.23);
  is $diff2, '';
} # _unified_diff

__PACKAGE__->runtests;

1;
