use strict;
use warnings;
use Path::Class;
use lib file (__FILE__)->dir->parent->subdir ('lib')->stringify;
use Test::More tests => 6;
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
                           'parent' => ['fc72a3fd895fc74e9f58da314df4bb864e14a075'],
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
                           'parent' => ['abbe65cb82aba0809cd7e213251b9ea475281fbb'],
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
                           'parent' => ['d5848510bb5f72cd3cc5fd15a009317c0f59b1bc'],
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

{
  my $git_svn_log = q{commit 3dacdd5fb1274551aced8c5f95e9af52b60aa029
tree b9e58b76bc5e8757477418c34aac4279a9ec6bdd
parent 684c8bdc2cc60550e4b1f8f161444ab8fc477ff3
author ianh <ianh@aaf4ba16-0b0e-0410-8dd5-8fac43db0bd1> 1155638417 +0000
committer ianh <ianh@aaf4ba16-0b0e-0410-8dd5-8fac43db0bd1> 1155638417 +0000

    boolean not bool in IDL

    git-svn-id: http://svn.whatwg.org/webforms@28 aaf4ba16-0b0e-0410-8dd5-8fac43db0bd1

commit 684c8bdc2cc60550e4b1f8f161444ab8fc477ff3
tree 334f6ab9730dc4c11125d816079c115f29a69781
parent 8b26162dfdb59374e4c3af7e2f95b6a4b69f63fc
author ianh <ianh@aaf4ba16-0b0e-0410-8dd5-8fac43db0bd1> 1155637304 +0000
committer ianh <ianh@aaf4ba16-0b0e-0410-8dd5-8fac43db0bd1> 1155637304 +0000

    Hidden controls shouldn't be validated, duh.

    git-svn-id: http://svn.whatwg.org/webforms@27 aaf4ba16-0b0e-0410-8dd5-8fac43db0bd1
};
  my $parsed = Git::Parser::Log->parse_format_raw ($git_svn_log);
  is $parsed->{commits}->[0]->{svn_repository}, q<http://svn.whatwg.org/webforms>;
  is $parsed->{commits}->[0]->{svn_revision}, 28;
  is $parsed->{commits}->[1]->{svn_repository}, q<http://svn.whatwg.org/webforms>;
  is $parsed->{commits}->[1]->{svn_revision}, 27;
}

{
  my $data_f = file (__FILE__)->dir->subdir ('data')->file ('git-log-raw-formatraw.txt');
  my $parsed = Git::Parser::Log->parse_format_raw (scalar $data_f->slurp);
  is_deeply $parsed, {
    'commits' => [
                         {
                           'body' => 'fill git/hg gap',
                           'commit' => '45a610a2f353a65abb57a97ffc3f6258dbdbc778',
                           'committer' => {
                                            'time' => '1342442647',
                                            'name' => 'Wakaba',
                                            'tz' => '+0900',
                                            'mail' => 'wakaba@lemon'
                                          },
                           'parent' => ['f1b00721364aec0c4cefe8c8d1bbbc5d9ee360f7'],
                           'tree' => 'ee9240b339d475a225931a02164d193e4c8f3199',
                           'files' => {
                                        't/git-hg-commitmapping.t' => {
                                                                        'old_commit' => '5ec7449',
                                                                        'mod_type' => 'M',
                                                                        'new_commit' => '9426c21',
                                                                        'new_mode' => '100644',
                                                                        'old_mode' => '100644'
                                                                      },
                                        'lib/Git/Hg/CommitMapping.pm' => {
                                                                           'old_commit' => '993c8bf',
                                                                           'mod_type' => 'M',
                                                                           'new_commit' => 'cd67c93',
                                                                           'new_mode' => '100644',
                                                                           'old_mode' => '100644'
                                                                         },
                                        't/data/git-hg-map.json' => {
                                                                      'old_commit' => '2f33149',
                                                                      'mod_type' => 'M',
                                                                      'new_commit' => '76d83a3',
                                                                      'new_mode' => '100644',
                                                                      'old_mode' => '100644'
                                                                    }
                                      },
                           'author' => {
                                         'time' => '1342442647',
                                         'name' => 'Wakaba',
                                         'tz' => '+0900',
                                         'mail' => 'wakaba@lemon'
                                       }
                         },
                         {
                           'body' => 'commandline interface for hg/git commit map',
                           'commit' => 'f1b00721364aec0c4cefe8c8d1bbbc5d9ee360f7',
                           'committer' => {
                                            'time' => '1342407988',
                                            'name' => 'Wakaba',
                                            'tz' => '+0900',
                                            'mail' => 'wakaba@lemon'
                                          },
                           'parent' => ['2f935dc58ef4ba5b9635d572797ee37e7e2f694b'],
                           'tree' => 'f503f0a4fb37b92729a7fec8d6b3d6766221aebf',
                           'files' => {
                                        'bin/generate-hg2gitmap.pl' => {
                                                                         'old_commit' => '0000000',
                                                                         'mod_type' => 'A',
                                                                         'new_commit' => '31c0056',
                                                                         'new_mode' => '100644',
                                                                         'old_mode' => '000000'
                                                                       },
                                        't/data/git-hg-map.json' => {
                                                                      'old_commit' => '0000000',
                                                                      'mod_type' => 'A',
                                                                      'new_commit' => '2f33149',
                                                                      'new_mode' => '100644',
                                                                      'old_mode' => '000000'
                                                                    },
                                        't/generate-hg2gitmap.t' => {
                                                                      'old_commit' => '0000000',
                                                                      'mod_type' => 'A',
                                                                      'new_commit' => '856d206',
                                                                      'new_mode' => '100644',
                                                                      'old_mode' => '000000'
                                                                    }
                                      },
                           'author' => {
                                         'time' => '1342407988',
                                         'name' => 'Wakaba',
                                         'tz' => '+0900',
                                         'mail' => 'wakaba@lemon'
                                       }
                         }
                       ]
  };
}

=head1 LICENSE

Copyright 2012 Wakaba <w@suika.fam.cx>.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
