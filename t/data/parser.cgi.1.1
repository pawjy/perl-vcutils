#!/usr/bin/perl
use strict;

use lib qw[.. /home/wakaba/public_html/-temp/wiki/lib];

use SuikaWiki::Input::HTTP; ## TODO: Use some better CGI module

my $http = SuikaWiki::Input::HTTP->new;

## TODO: _charset_

my $mode = $http->meta_variable ('PATH_INFO');
## TODO: decode unreserved characters

if ($mode eq '/html' or $mode eq '/error-and-html') {
  require Encode;
  require What::HTML;
  require What::NanoDOM;

  my $s = $http->parameter ('s');
  if (length $s > 1000_000) {
    print STDOUT "Status: 400 Document Too Long\nContent-Type: text/plain; charset=us-ascii\n\nToo long";
    exit;
  }

  $s = Encode::decode ('utf-8', $s);

  print STDOUT "Content-Type: text/plain; charset=utf-8\n\n";

  my $onerror = $mode eq '/error-and-html' ? sub {
    print STDOUT "0,0,", $_[0], "\n";
  } : sub { };

  my $doc = What::HTML->parse_string
      ($s => What::NanoDOM::Document->new, $onerror);

  if ($mode eq '/error-and-html') {
    print "--\n";
  }

  my $html = What::HTML->get_inner_html ($doc);
  print STDOUT Encode::encode ('utf-8', $$html);
} else {
  print STDOUT "Status: 404 Not Found\nContent-Type: text/plain; charset=us-ascii\n\n404";
}
