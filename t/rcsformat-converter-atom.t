package test::RCSFormat::Converter::Atom;
use strict;
use warnings;
use Path::Class;
use lib file (__FILE__)->dir->parent->subdir ('lib')->stringify;
use lib file (__FILE__)->dir->parent->subdir ('modules/charclass/lib')->stringify;
use lib file (__FILE__)->dir->parent->subdir ('modules/manakai/lib')->stringify;
use Test::More;
use Test::Differences;
use base qw(Test::Class);
use RCSFormat::File;
use RCSFormat::Converter::Atom;

my $test_f = file (__FILE__)->dir->subdir ('data')->file ('parser.cgi,v');
my $test_atom_f = file (__FILE__)->dir->subdir ('data')->file ('parser.cgi.atom');

sub getrcs (;$) {
  return RCSFormat::File->new_from_stringref (\ scalar $test_f->slurp);
} # getrcs

sub is_f_content ($$;$) {
  eq_or_diff $_[0], scalar $_[1]->slurp, $_[2];
} # is_f_content

sub _to_atom : Test(1) {
  my $rcs = getrcs;
  $rcs->file_name ('parser.cgi');

  my $atom = rcs_to_atom_feed $rcs;
  is_f_content $atom->inner_html, $test_atom_f;
} # _to_atom

__PACKAGE__->runtests;

1;
