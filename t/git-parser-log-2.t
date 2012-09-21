use strict;
use warnings;
use Path::Class;
use lib file (__FILE__)->dir->parent->subdir ('lib')->stringify;
use Test::More tests => 1;
use Git::Parser::Log;

my $data_f = file (__FILE__)->dir->subdir ('data')->file ('git-show-merge.txt');
my $parsed = Git::Parser::Log->parse_format_raw (scalar $data_f->slurp);
is_deeply $parsed, {
  'commits' => [
                         {
                           'body' => q{Merge branch 'master' of github.com:wakaba/manakai},
                           'commit' => '1c5aa54af0918987a1d64574444e2a3c08f09d24',
                           'committer' => {
                                            'time' => '1345282921',
                                            'name' => 'Wakaba',
                                            'tz' => '+0900',
                                            'mail' => 'wakaba@lemon'
                                          },
                           'parent' => [
                               'fc06877246b4fb7ec905819a5513a95ae50abbbe',
                               'a7e519957514fd47d486d8950c38c0039f2c5f8d',
                           ],
                           'tree' => 'd3cad731c46daaf1556d61df3b97c7336c33e4f6',
                           'author' => {
                                         'time' => '1345282921',
                                         'name' => 'Wakaba',
                                         'tz' => '+0900',
                                         'mail' => 'wakaba@lemon'
                                       }
                         }
  ]
};

=head1 LICENSE

Copyright 2012 Wakaba <w@suika.fam.cx>.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
