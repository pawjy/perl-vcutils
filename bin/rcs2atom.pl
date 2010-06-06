#!/usr/bin/perl
use strict;
use warnings;
our $VERSION = '1.0';

use Path::Class;
use lib file (__FILE__)->dir->parent->subdir ('lib')->stringify;
use lib file (__FILE__)->dir->parent->subdir ('modules/charclass/lib')->stringify;
use lib file (__FILE__)->dir->parent->subdir ('modules/manakai/lib')->stringify;

use Getopt::Long;
use Pod::Usage;

GetOptions (
  'help' => sub {
    pod2usage ({-verbose => 1, -exitval => 0, -output => \*STDOUT});
  },
);

use RCSFormat::File;
use RCSFormat::Converter::Atom;

local $/ = undef;
my $input = <>;

my $rcs = RCSFormat::File->new_from_stringref (\$input);

my $file_name = $ARGV;
$file_name =~ s/,v$//;
$rcs->file_name ($file_name);

my $doc = rcs_to_atom_feed $rcs;
print $doc->inner_html;

__END__

=head1 NAME

rcs2atom - RCS to Atom Feed Converter

=head1 SYNOPSIS

  perl bin/rcs2atom.pl input,v > output.atom

=head1 DESCRIPTION

The C<rcs2atom> script generates an Atom Feed Document from an RCS
file.

=head1 AUTHOR

Wakaba <w@suika.fam.cx>.

=head1 LICENSE

Copyright 2010 Wakaba <w@suika.fam.cx>.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
