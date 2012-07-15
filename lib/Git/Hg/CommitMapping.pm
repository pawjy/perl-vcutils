package Git::Hg::CommitMapping;
use strict;
use warnings;
our $VERSION = '1.0';

sub load_git_hg_mapping ($) {
  my ($self, $repo_root_d) = @_;
  
  my $mapping_f = $repo_root_d->subdir ('.git', 'hgremote')->file ('hg2git-mapping');
  my $marks_f = $repo_root_d->subdir ('.git', 'hgremote')->file ('hg2git-marks');
  my $mapping = {};
  my $marks = {};

  if (-f $mapping_f) {
    for ($mapping_f->slurp) {
      if (/:([0-9a-f]+) ([0-9]+)/) {
        $mapping->{$2} = $1;
      }
    }
  }
  if (-f $marks_f) {
    for ($marks_f->slurp) {
      if (/:([0-9]+) ([0-9a-f]+)/) {
        $marks->{$1} = $2;
      }
    }
  }

  my $hg2git = {};
  my $git2hg = {};
  
  for my $changeset (keys %$mapping) {
    my $git = $marks->{$changeset} or next;
    my $hg = $mapping->{$changeset} or next;
    $hg2git->{$hg} = $git;
    $git2hg->{$git} = $hg;
  }
  
  return {
    hg2git => $hg2git,
    git2hg => $git2hg,
  };
} # load_git_hg_mapping

1;

=head1 LICENSE

Copyright 2012 Wakaba <w@suika.fam.cx>.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
