package RCSFormat::Diff;
use strict;
use warnings;
our $VERSION = '1.0';

use Exporter::Lite;
our @EXPORT = qw(
  parse_rcs_diff
  apply_rcs_diff
);

sub parse_rcs_diff ($) {
  #my ($diffref) = @_;

  my $additions = [];
  my $deletions = [];

  pos ${$_[0]} = 0;
  while (pos ${$_[0]} < length ${$_[0]}) {
    if (${$_[0]} =~ /\G([ad])([0-9]+) ([0-9]+)(?:\x0A|\z)/g) {
      my $cmd = $1;
      my $start = $2 +1-1;
      my $length = $3 +1-1;
      
      if ($cmd eq 'a') {
        my $new_start = pos ${$_[0]};
        while (${$_[0]} =~ /\x0A|\z/g) {
          $length--;
          last if $length == 0;
        }
        my $new_end = pos ${$_[0]};
        push @$additions, [$start => $new_start, $new_end];
      } elsif ($cmd eq 'd') {
        push @$deletions, [$start, $length];
      } else {
        die;
      }
    } else {
      warn "Unexpected line: " . substr (${$_[0]}, pos ${$_[0]}, 10) . "\n";
      ${$_[0]} =~ /\x0A|\z/g;
    }
  }
  
  return [$additions, $deletions];
} # parse_rcs_diff

sub apply_rcs_diff ($$) {
  #my ($sref, $diffref) = @_;

  my $diff = parse_rcs_diff $_[1];

  my $line_to_offset = {};
  my $line_to_add_action = {};
  my $line_to_del_action = {};
  for (@{$diff->[0]}) { ## additions
    $line_to_offset->{$_->[0]} = undef;

    $line_to_add_action->{$_->[0]} = $_;
  }
  for (@{$diff->[1]}) { ## deletions
    $line_to_offset->{$_->[0]} = undef;
    $line_to_offset->{$_->[0] + $_->[1]} = undef;

    $line_to_del_action->{$_->[0] + $_->[1]} = $_;
  }

  pos (${$_[0]}) = 0;
  my $line = 01;
  while (pos ${$_[0]} < length ${$_[0]}) {
    if (exists $line_to_offset->{$line}) {
      $line_to_offset->{$line} = pos ${$_[0]};
    }

    if (${$_[0]} =~ /\x0A/g) {
      $line++;
    } elsif (${$_[0]} =~ /\z/g) {
      #
    }
  }
  if (exists $line_to_offset->{$line} and not $line_to_offset->{$line}) {
    $line_to_offset->{$line} = pos ${$_[0]};
  }

  for my $line (sort { $b <=> $a } keys %$line_to_offset) {
    my $del_action = $line_to_del_action->{$line};
    if ($del_action) {
      my $start_offset = $line_to_offset->{$del_action->[0]};
      my $end_offset = $line_to_offset->{$del_action->[0] + $del_action->[1]};
      if (defined $start_offset and defined $end_offset) {
        substr (${$_[0]}, $start_offset, $end_offset - $start_offset) = '';
        $line_to_offset->{$_} = $line_to_offset->{$del_action->[0]}
            for ($del_action->[0] + 1)..($del_action->[0] + $del_action->[1]);
      } else {
        warn "Line $line not found\n" unless defined $start_offset;
        warn "Line ${\($del_action->[0] + $del_action->[1] - 1)} not found\n"
            unless defined $end_offset;
      }
    }

    my $add_action = $line_to_add_action->{$line};
    if ($add_action) {
      my $start_offset = $line_to_offset->{$line};
      if (defined $start_offset) {
        my $new = substr (${$_[1]}, $add_action->[1], $add_action->[2] - $add_action->[1]);
        $new =~ s/\@\@/\@/g;
        substr (${$_[0]}, $start_offset, 0) = $new;
      } else {
        warn "Line ${\($line + 1)} not found\n";
      }
    }
  }
} # apply_rcs_diff

1;

=head1 LICENSE

Copyright 2010 Wakaba <w@suika.fam.cx>.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
