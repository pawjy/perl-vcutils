package Git::Parser::Log;
use strict;
use warnings;
our $VERSION = '1.0';

sub parse_format_raw ($$) {
  my $class = shift;

  my $parsed = {
    commits => [],
  };
  
  my $last_commit = {};
  for (split /\x0D?\x0A/, $_[0]) {
    if (/^commit ([0-9a-f]+)$/) {
      $last_commit = {commit => $1};
      push @{$parsed->{commits}}, $last_commit;
    } elsif (/^(author|committer) (.+?) <([^<>]+)> ([0-9]+) ([+-][0-9]{4})$/) {
      $last_commit->{$1} = {
        name => $2,
        mail => $3,
        time => $4,
        tz => $5,
      };
    } elsif (/^(\S+) (.+)$/) {
      $last_commit->{$1} = $2;
    } elsif (/^    (.*)/) {
      if (defined $last_commit->{body}) {
        $last_commit->{body} .= "\n" . $1;
      } else {
        $last_commit->{body} = $1;
      }
    }
  }

  return $parsed;
} # parse_format_raw

1;

=head1 LICENSE

Copyright 2012 Wakaba <w@suika.fam.cx>.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
