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
use Encode;
use Git::Parser::Log;
use JSON::Functions::XS qw(perl2json_bytes_for_record);

local $/ = undef;
my $parsed = Git::Parser::Log->parse_format_raw (decode 'utf-8', <>);
print perl2json_bytes_for_record $parsed;

=head1 LICENSE

Copyright 2012-2014 Wakaba <wakaba@suikawiki.org>.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
