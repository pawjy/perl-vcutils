package Git::Parser::Log;
use strict;
use warnings;
our $VERSION = '3.0';

sub parse_format_raw ($$) {
  my $class = shift;

  my $parsed = {
    commits => [],
  };
  
  my $last_commit = {};
  for (split /\x0D?\x0A/, $_[0], -1) {
    if (/^commit ([0-9a-f]+)$/) {
      $last_commit = {commit => $1};
      push @{$parsed->{commits}}, $last_commit;
    } elsif (/^(author|committer) (.+?) <([^<>]*)> ([0-9]+) ([+-][0-9]{4})$/) {
      $last_commit->{$1} = {
        name => $2,
        mail => $3,
        time => $4,
        tz => $5,
      };
    } elsif (/^([^:\s]\S*) (.+)$/) {
      if ($1 eq 'parent') {
        push @{$last_commit->{$1} ||= []}, $2;
      } else {
        $last_commit->{$1} = $2;
      }
    } elsif (/^    (.*)/) {
      if (defined $last_commit->{body}) {
        $last_commit->{body} .= "\n" . $1;
      } else {
        $last_commit->{body} = $1;
      }
    } elsif (/^:[0-9]+/) {
      my ($old_mod, $new_mod, $old_commit, $new_commit, $type, $name) 
          = split /\s+/, $_, 6;
      $old_mod =~ s/^://;
      $old_commit =~ s/\.\.\.$//;
      $new_commit =~ s/\.\.\.$//;
      $last_commit->{files}->{$name} =
          {old_mode => $old_mod, new_mode => $new_mod,
           old_commit => $old_commit, new_commit => $new_commit,
           mod_type => $type};
    } else {
      if (defined $last_commit->{body}) {
        if ($last_commit->{body} =~ /(?:^|\n)git-svn-id: (.+?)\@([0-9]+) .+$/) {
          $last_commit->{svn_repository} = $1;
          $last_commit->{svn_revision} = $2;
        }
      }
    }
  }

  return $parsed;
} # parse_format_raw

1;

=head1 LICENSE

Copyright 2012-2018 Wakaba <wakaba@suikawiki.org>.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
