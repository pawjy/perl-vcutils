#!/usr/bin/perl
use strict;
use warnings;
use Path::Class;
use lib glob file (__FILE__)->dir->parent->subdir ('modules/*/lib');
use LWP::Simple;
use Message::DOM::DOMImplementation;
our $VERSION = '1.0';

my $root;
my $output_prefix;
my @url;

{
  $root = shift or die "Usage: $0 url\n";
  push @url, $root;

  if ($root =~ m[([^/]+)/$]) {
    $output_prefix = $1 . '/';
  }
}

my $files = {};
my $dirs = {};

my $checked_urls = {};
while (@url) {
  my $url = shift @url;
  
  last if $checked_urls->{$url};
  $checked_urls->{$url} = 1;

  warn "<$url>...\n";
  my $html = get $url or do { warn "Can't retrieve <$url>; skipped\n"; next };
  
  my $dom = Message::DOM::DOMImplementation->new;
  my $doc = $dom->create_document;
  $doc->manakai_is_html (1);
  $doc->inner_html ($html);
  $doc->manakai_entity_base_uri ($url);
  
  my $els = $doc->query_selector_all ('td a');
  for my $el (@$els) {
    my $href = $el->href;
    if ($href =~ m[^\Q$url\E([^/?]+)(/|\?view=.+|)$]) {
      my $new_url = $url . $1;
      if ($2 eq '/') {
        push @url, $new_url . q</>;
        $dirs->{$new_url . q</>} = 1;
      } else {
        $files->{$new_url} = 1;
      }
    }
  } # @$els
} # @url

print "mkdir $output_prefix\n";

my $d_pattern = qq[mkdir %s\n];
printf $d_pattern, $_
    for map { s/^\Q$root\E//o; $output_prefix . $_ }
    sort { $a cmp $b } keys %$dirs;

my $f_pattern = qq[perl bin/viewvclog2rcs.pl --log-uri %s > %s,v\nsleep 1\n];
printf $f_pattern, $_->[0], $_->[1]
    for map { my $v = $_; my $w = $v; $w =~ s/^\Q$root\E//o;
              [$v, $output_prefix . $w] }
    sort { $a cmp $b } keys %$files;

=head1 LICENSE

Copyright 2010 Wakaba <w@suika.fam.cx>.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
