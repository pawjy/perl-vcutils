#!/usr/bin/perl 
use strict;
use Path::Class;
use lib file (__FILE__)->dir->parent->subdir ('lib')->stringify;
our $VERSION = '1.2';
require RCSFormat;
require IO::File;

$/ = undef;
my $filename = shift @ARGV;
my $rcs = new RCSFormat;
my $in = new IO::File $filename, 'r' or die "$0: $filename: $!";
binmode $in;
$rcs->parse_text (scalar <$in>);
close $in;

my %outputed;
$filename =~ s/,v$//g;
output_file ($rcs, revision => $rcs->{admin}->{head}, filename_base => $filename);

sub output_file ($%) {
  my ($rcs, %opt) = @_;
  my $date = $rcs->{delta}->{$opt{revision}}->{date};
  $date =~ s/^(\d\d)\./19$1/;
  $date =~ tr/.//d;
  my $filename = $opt{filename_base} . '.' . $date;
  if (-e $filename) {
    my $i = 1;
    $i++ while -e $filename . '.' . $i;
    $filename .= '.' . $i;
  }
  
  STDERR->print ("$0: Writing $opt{revision} as $filename...\n");
  
  my $text;
  if ($opt{previous_text}) {
    $text = patch_rcs_diff ($opt{previous_text}
              => \$rcs->{deltatext}->{$opt{revision}}->{text});
  } else {
    $text = $rcs->{deltatext}->{$opt{revision}}->{text};
  }
  my $file = new IO::File $filename, 'w' or die "$0: $filename: $!";
  binmode $file;
  print $file ($text);
  $file->close;
  
  $outputed{$opt{revision}} = 1;
  output_file ($rcs, %opt, revision => $rcs->{delta}->{$opt{revision}}->{next},
               previous_text => \$text)
    if $rcs->{delta}->{$opt{revision}}->{next} and
       not $outputed{$rcs->{delta}->{$opt{revision}}->{next}};
}

sub patch_rcs_diff ($$) {
  my @src = split /\x0A/, ${+shift}, -1;
  my @patch = split /\x0A/, ${+shift}, -1;
  my @result;
  my $i = 0;
  while (@patch) {
    $_ = shift @patch;
    if (/^a(\d+) (\d+)/) {
      push @result, @src[$i..$1-1], splice @patch, 0, $2;
      $i = $1;
    } elsif (/^d(\d+) (\d+)/) {
      push @result, @src[$i..$1-2];
      $i = $1 - 1 + $2;
    } else {
      warn "$0: Invalid diff: ".$_ unless $_ eq '';
    }
  }
  push @result, @src[$i..$#src];
  join "\x0A", @result;
}

__END__

=head1 NAME

splitrcs - Split RCS file

=head1 SYNOPSIS

  splitrcs.pl rcs,v

=head1 DESCRIPTION

C<splitrcs> splits a RCS format version history file into multiple files.
Each history entry is saved as a single file, with its filename suffixed by
FULL STOP (.) and DIGITs representing last-modified date-time.

=head1 BUGS

=over 4

=item *

This script does not support branches yet.

=item *

C<--help> should display help message.

=back

=head1 SEE ALSO

rcsfile(5), C<knitmodule.pl>, C<RCSFormat.pm>

=head1 LICENSE

Copyright 2004 Wakaba <w@suika.fam.cx>.  All rights reserved.

This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.

=cut
