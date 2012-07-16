#!/usr/bin/perl
use strict;
BEGIN {
  my $file_name = __FILE__; $file_name =~ s{[^/]+$}{}; $file_name ||= '.';
  $file_name .= '/../config/perl/libs.txt';
  if (-f $file_name) {
    open my $file, '<', $file_name or die "$0: $file_name: $!";
    unshift @INC, split /:/, scalar <$file>;
  }
}
use warnings;
use Path::Class;
use lib file (__FILE__)->dir->parent->subdir ('lib')->stringify;
use lib glob file (__FILE__)->dir->parent->subdir ('modules', '*', 'lib')->stringify;
use Git::Hg::CommitMapping;
use JSON::Functions::XS qw(perl2json_bytes_for_record);

my $repo_d = dir (shift || '.');
my $parsed = Git::Hg::CommitMapping->load_git_hg_mapping ($repo_d);
print perl2json_bytes_for_record $parsed;

=head1 LICENSE

Copyright 2012 Wakaba <w@suika.fam.cx>.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
