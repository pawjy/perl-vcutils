#!/usr/bin/perl 
use lib q#../lib#;
use strict;
our $VERSION=do{my @r=(q$Revision: 1.2 $=~/\d+/g);sprintf "%d."."%02d" x $#r,@r};
require RCSFormat;
require Getopt::Long;
require IO::File;


sub rcsdate ($) {
  my ($s, $min, $h, $d, $m, $y) = gmtime shift;
  $y += 1900 unless $y < 100 and $y > 0;
  $m++;
  sprintf '%02d.%02d.%02d.%02d.%02d.%02d', $y, $m, $d, $h, $min, $s;
}


sub commit_file ($%) {
  my ($filename, %opt) = @_;
  my $rcs = new RCSFormat;
  my $rev;
  
  $/ = undef;
  my $rcsfilename = $opt{module_directory} . '/' . ($opt{repository_filename} || $filename) . ',v';
  my $rcsfile_modified = 0;
  my $current_text;
  my $currev;
  if (-e $rcsfilename) {
    my $rcsfile = new IO::File $rcsfilename, 'r' or die "$0: $rcsfilename: $!";
    binmode $rcsfile;
    $rcs->parse_text (scalar <$rcsfile>);
    $rcsfile->close;
    
    $currev = rcsrevision->new ($rcs->{admin}->{head});
    $rev = $currev->next_revision;
    
    $current_text = $rcs->{deltatext}->{$currev}->{text};
    
    require File::Temp;
    my $current_file = new File::Temp;
    my (undef, $diff_filemame) = File::Temp::tempfile ('DIFFXXXX',
                                                       DIR => File::Temp::tempdir (),
                                                       OPEN => 0);
    $current_file->print ($current_text);
    require IPC::Open2;
    IPC::Open2::open2 (my $diffin, my $diffout, $opt{diff_command}, @{$opt{diff_option}},
                       $filename => $current_file->filename)
      or die "$0: diff: $!";
    binmode $diffin;
    my $difftext = <$diffin>;
    if (length $difftext) {
      $rcs->{delta}->{$rev}->{next} = $currev;
      $rcs->{deltatext}->{$currev}->{text} = $difftext;
      $rcsfile_modified = 1;
    } else {
      undef $rev;
    }
  } else {
    my @src_file = sort {$a cmp $b} grep /\.\d{14,}$/, glob $filename.'.*';
    push @src_file, $filename if -e $filename;
    $rev = new rcsrevision 1.1;
    if (@src_file > 1) {
      require Time::Local;
      require IPC::Open2;
      for my $i (1..$#src_file) {
        $currev = $rev;
        $rev = $currev->next_revision;
        
        STDERR->print ("$0: $filename: $src_file[$i-1]...\n");
        local $opt{commit_time} = $opt{commit_time};
        if ($src_file[$i-1] =~ /\.(\d+)(\d\d)(\d\d)(\d\d)(\d\d)(\d\d)$/) {
          $opt{commit_time} = Time::Local::timegm_nocheck ($6, $5, $4, $3, $2-1, $1-1900);
        }
        
        IPC::Open2::open2 (my $diffin, my $diffout, $opt{diff_command}, @{$opt{diff_option}},
                           $src_file[$i] => $src_file[$i-1])
          or die "$0: diff: $!";
        binmode $diffin;
        my $difftext = <$diffin>;
        if (length $difftext) {
          $rcs->{delta}->{$rev}->{next} = $currev;
          $rcs->{delta}->{$currev}->{date} = rcsdate $opt{commit_time} || [stat $filename]->[9];
          $rcs->{delta}->{$currev}->{author} = $opt{author};
          $rcs->{delta}->{$currev}->{state} = 'Exp';
          $rcs->{deltatext}->{$currev}->{log} = $opt{commit_log};
          $rcs->{deltatext}->{$currev}->{text} = $difftext;
          $rcsfile_modified = 1;
        } else {
          $rev = $currev;
        }
      }
    }
    if (@src_file) {
      $filename = pop @src_file;
    } else {
      STDERR->print ("$0: $filename: No target file\n");
      return 0;
    }
  }

if (defined $rev) {
  $rcsfile_modified = 1;
  my $new_file = new IO::File $filename, 'r' or die "$0: $filename: $!";
  binmode $new_file;
  $rcs->{deltatext}->{$rev}->{text} = <$new_file>;
  $new_file->close;
  
  if ($filename =~ /\.(\d+)(\d\d)(\d\d)(\d\d)(\d\d)(\d\d)$/) {
    require Time::Local;
    $rcs->{delta}->{$rev}->{date} = rcsdate Time::Local::timegm_nocheck ($6, $5, $4, $3, $2-1, $1-1900);
  } else {
    $rcs->{delta}->{$rev}->{date} = rcsdate $opt{commit_time} || [stat $filename]->[9];
  }
  $rcs->{delta}->{$rev}->{author} = $opt{author};
  $rcs->{delta}->{$rev}->{state} = 'Exp';
  $rcs->{deltatext}->{$rev}->{log} = $opt{commit_log};
  
  $rcs->{admin}->{head} = $rev;
  $rcs->{admin}->{strict} ||= 1;
  $rcs->{admin}->{comment} ||= '# ';
  $rcs->{admin}->{expand} ||= $opt{keyword_expand};
}

if ($rcsfile_modified) {
  my $rcsfile = new IO::File $rcsfilename, 'w' or die "$0: $rcsfilename: $!";
  binmode $rcsfile;
  $rcsfile->print ($rcs->stringify);
  $rcsfile->close;
  return 1;
} else {
  return 0;
}
}


package rcsrevision;
use overload
    '+' => sub {$_[0]->clone->plus ($_[1])},
    '+=' => 'plus',
    '""' => 'stringify',
    fallback => 1;

sub new ($$) {
  my $class = shift;
  bless [split /\./, shift || '1.1'], $class;
}

sub plus ($$) {
  my $self = shift;
  my $p = shift;
  $p = [split /\./, $p] unless ref $p;
  for (0..$#$p) {
    $self->[$_] += $p->[$_];
  }
  $self;
}

sub next_revision ($$) {
  my $clone = shift->clone;
  $clone->[$#$clone]++;
  $clone;
}

sub stringify ($) {
  join '.', @{+shift};
}

sub clone ($) {
  bless [@{$_[0]}], ref $_[0];
}

package main;
MAIN: {
my %opt = (
  author	=> $ENV{USER} || 'knitmodule',
  diff_command	=> 'diff',
  diff_option	=> '--rcs',
  expand	=> 'b',
  module_directory	=> q<CVS>,
  recursive	=> 1,
);

Getopt::Long::GetOptions (
  'author=s'	=> \$opt{author},
  'commit-date=s'	=> \$opt{commit_time},
  'diff-command=s'	=> \$opt{diff_command},
  'diff-option=s'	=> \$opt{diff_option},
  'm=s'	=> \$opt{commit_log},
  'd=s'	=> \$opt{module_directory},
  'k=s'	=> \$opt{keyword_expand},
  'recursive'	=> \$opt{recursive},
  'repository-filename=s'	=> \$opt{repository_filename},
);
## BUG: This code doesn't cope w/ quoted argument
$opt{diff_option} = [split /\s+/, $opt{diff_option}];
if ($opt{commit_time}) {
  require Time::Local;
  $opt{commit_time} =~ /(\d+)-?(\d+)?-?(\d+)?[T\s]?(\d+)?:?(\d+)?:?(\d+)?([+-]\d+)?:?(\d+)/;
  $opt{commit_time} = Time::Local::timegm_nocheck ($6, $5, $4, $3, $2-1, $1-1900) - $7 * 3600 - $8;
}
  
  die "$0: Filename not specified" unless @ARGV;
  for (map {glob} @ARGV) {
    STDERR->print ("$0: $_...");
    if (-d $_) {
      commit_directory ($_, %opt) if $opt{recursive};
    } elsif (commit_file ($_, %opt)) {
      STDERR->print ("done\n");
    } else {
      STDERR->print ("not modified\n");
    }
  }
}

sub commit_directory ($%) {
  my ($dir_name, %opt) = @_;
  require IO::Dir;
  my $dir = new IO::Dir $dir_name or die "$0: $dir_name: $!";
  STDERR->print ("$0: Directory $dir_name...\n");
  mkdir $opt{module_directory}.'/'.$dir_name
    or die "$0: $opt{module_directory}/$dir_name: $!"
    unless -e $opt{module_directory}.'/'.$dir_name;
  while (defined ($_ = $dir->read)) {
    next if $_ eq '..' or $_ eq '.';
    STDERR->print ("$0: $dir_name/$_...");
    if (-d $_) {
      commit_directory ($dir_name.'/'.$_, %opt) if $opt{recursive};
    } elsif (commit_file ($dir_name.'/'.$_, %opt)) {
      STDERR->print ("done\n");
    } else {
      STDERR->print ("not modified\n");
    }
  }
  return 1;
}

__END__

=head1 NAME

knitmodule - Generating RCS format history file from variant files

=head1 SYNOPSIS

knitmodule.pl [--author=author-name] [--commit-date=rfc3339-date] [--diff-command=diff] [--diff-option=diff-option] [-m "Commit log message"] [-d repository-directory] [-k keyword-substition] [--recursive] [--repository-filename=filename] target-file1 [target-file2, ...]

=head1 DESCRIPTION

C<knitmodule> generates RCS format history file(s) from source file(s) that is/are
version variant of something.  RCS file(s) is/are created in directory specified by
C<-d> option, that defaults to C<./CVS>, with filename specified by
C<--repository-filename>, which defaults to C<target-file,v>.  If RCS file(s)
already exist(s) in repository, target file is commited as the latest version
(in trunk).  Otherwise, new repository file is created.
C<target-file> might be a directory, in case C<--recursive> option specified.

=head2 Target File With Date Suffixed Filename

When RCS file corresponding to the target file does not found,
"date suffixed filename" files in the same directory as target file are collected
and used to construct new repository file. "Date suffix" consists of a FULL STOP
(.) and more than 13 DIGITs, representing date-time in UTC.  "Date suffixed" variants
are sorted by its date and logged as revisions in RCS file, just before target file
is committed (as the latest version).

=head1 BUGS

=over 4

=item *

This script does not support branches yet, although it does not break
existing branches.

=item *

C<--help> should display help message.

=back

=head1 SEE ALSO

rcsfile(5), C<splitrcs.pl>, C<RCSFormat.pm>

=head1 LICENSE

Copyright 2004 Wakaba <w@suika.fam.cx>.  All rights reserved.

This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.

=cut

# $Date: 2004/01/25 07:55:12 $
