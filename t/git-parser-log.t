use strict;
use warnings;
use Path::Class;
use lib file (__FILE__)->dir->parent->subdir ('lib')->stringify;
use Test::More tests => 1;
use Git::Parser::Log;

my $data_f = file (__FILE__)->dir->subdir ('data')->file ('git-log-formatraw.txt');
my $parsed = Git::Parser::Log->parse_format_raw (scalar $data_f->slurp);
is_deeply $parsed, {
  'commits' => [
                         {
                           'body' => 'New',
                           'commit' => 'f8a6ec71ccb9c98bb75ea683cd2d1e52266d9d61',
                           'committer' => {
                                            'time' => '1187090567',
                                            'name' => 'Wakaba',
                                            'tz' => '+0000',
                                            'mail' => 'w@suika.fam.cx'
                                          },
                           'parent' => 'fc72a3fd895fc74e9f58da314df4bb864e14a075',
                           'tree' => 'f8e7b11644011f7e2009ad77261581b7ab867d09',
                           'author' => {
                                         'time' => '1187090567',
                                         'name' => 'Wakaba',
                                         'tz' => '+0000',
                                         'mail' => 'w@suika.fam.cx'
                                       }
                         },
                         {
                           'body' => '2007-08-14  Wakaba  <wakaba@suika.fam.cx>

        * RCSFormat.pm (stringify): Don\'t put spaces after |access|
        attribute name if the attribute has empty value, for
        textual compatibility with RCS.  Newlines are added/removed
        for textual compatibility with RCS.

2007-08-14  Wakaba  <wakaba@suika.fam.cx>

        * viewvclog2rcs.pl: New file.',
                           'commit' => 'fc72a3fd895fc74e9f58da314df4bb864e14a075',
                           'committer' => {
                                            'time' => '1187085154',
                                            'name' => 'Wakaba',
                                            'tz' => '+0000',
                                            'mail' => 'w@suika.fam.cx'
                                          },
                           'parent' => 'abbe65cb82aba0809cd7e213251b9ea475281fbb',
                           'tree' => '589098247e322133196a2af6bb0164abeb43bc2a',
                           'author' => {
                                         'time' => '1187085154',
                                         'name' => 'Wakaba',
                                         'tz' => '+0000',
                                         'mail' => 'w@suika.fam.cx'
                                       }
                         },
                         {
                           'body' => 'Typo fixed',
                           'commit' => 'abbe65cb82aba0809cd7e213251b9ea475281fbb',
                           'committer' => {
                                            'time' => '1075017312',
                                            'name' => 'Wakaba',
                                            'tz' => '+0000',
                                            'mail' => 'w@suika.fam.cx'
                                          },
                           'parent' => 'd5848510bb5f72cd3cc5fd15a009317c0f59b1bc',
                           'tree' => '8025037985400053e42330fa0e92e812e1001efd',
                           'author' => {
                                         'time' => '1075017312',
                                         'name' => 'Wakaba',
                                         'tz' => '+0000',
                                         'mail' => 'w@suika.fam.cx'
                                       }
                         },
                         {
                           'body' => 'New',
                           'commit' => 'd5848510bb5f72cd3cc5fd15a009317c0f59b1bc',
                           'committer' => {
                                            'time' => '1075017155',
                                            'name' => 'Wakaba',
                                            'tz' => '+0000',
                                            'mail' => 'w@suika.fam.cx'
                                          },
                           'tree' => '5582d03380eed876faf189bb22be4b5db9bbfc31',
                           'author' => {
                                         'time' => '1075017155',
                                         'name' => 'Wakaba',
                                         'tz' => '+0000',
                                         'mail' => 'w@suika.fam.cx'
                                       }
                         }
  ]
};

=head1 LICENSE

Copyright 2012 Wakaba <w@suika.fam.cx>.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
