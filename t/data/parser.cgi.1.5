#!/usr/bin/perl
use strict;

use lib qw[/home/httpd/html/www/markup/html/whatpm
           /home/wakaba/public_html/-temp/wiki/lib];
use CGI::Carp qw[fatalsToBrowser];

use SuikaWiki::Input::HTTP; ## TODO: Use some better CGI module

my $http = SuikaWiki::Input::HTTP->new;

## TODO: _charset_

my $mode = $http->meta_variable ('PATH_INFO');
## TODO: decode unreserved characters

if ($mode eq '/html' or $mode eq '/test') {
  require Encode;
  require Whatpm::HTML;
  require Whatpm::NanoDOM;

  my $s = $http->parameter ('s');
  if (length $s > 1000_000) {
    print STDOUT "Status: 400 Document Too Long\nContent-Type: text/plain; charset=us-ascii\n\nToo long";
    exit;
  }

  $s = Encode::decode ('utf-8', $s);

  print STDOUT "Content-Type: text/plain; charset=utf-8\n\n";

  print STDOUT "#errors\n";

  my $onerror = sub {
    my (%opt) = @_;
    print STDOUT "$opt{line},$opt{column},$opt{type}\n";
  };

  my $doc = Whatpm::HTML->parse_string
      ($s => Whatpm::NanoDOM::Document->new, $onerror);

  print "#document\n";

  my $out;
  if ($mode eq '/html') {
    $out = Whatpm::HTML->get_inner_html ($doc);
  } else { # test
    $out = test_serialize ($doc);
  }
  print STDOUT Encode::encode ('utf-8', $$out);
  print STDOUT "\n";

  if ($http->parameter ('dom5')) {
    require Whatpm::ContentChecker;
    print STDOUT "#domerrors\n";
    my $docel = $doc->document_element;
    my $docel_nsuri = $docel->namespace_uri;
    if (defined $docel_nsuri and 
        $docel_nsuri eq q<http://www.w3.org/1999/xhtml> and
        $docel->manakai_local_name eq 'html') {
      #
    } else {
      print STDOUT get_node_path ($docel) . ";element not allowed\n";
    }
    my $cc = Whatpm::ContentChecker->new;
    $cc->check_element ($docel, sub {
      my %opt = @_;
      print STDOUT get_node_path ($opt{node}) . ';' . $opt{type} . "\n";
    });
  }
} else {
  print STDOUT "Status: 404 Not Found\nContent-Type: text/plain; charset=us-ascii\n\n404";
}

exit;

sub test_serialize ($) {
  my $node = shift;
  my $r = '';

  my @node = map { [$_, ''] } @{$node->child_nodes};
  while (@node) {
    my $child = shift @node;
    my $nt = $child->[0]->node_type;
    if ($nt == $child->[0]->ELEMENT_NODE) {
      $r .= '| ' . $child->[1] . '<' . $child->[0]->tag_name . ">\x0A"; ## ISSUE: case?

      for my $attr (sort {$a->[0] cmp $b->[0]} map { [$_->name, $_->value] }
                    @{$child->[0]->attributes}) {
        $r .= '| ' . $child->[1] . '  ' . $attr->[0] . '="'; ## ISSUE: case?
        $r .= $attr->[1] . '"' . "\x0A";
      }
      
      unshift @node,
        map { [$_, $child->[1] . '  '] } @{$child->[0]->child_nodes};
    } elsif ($nt == $child->[0]->TEXT_NODE) {
      $r .= '| ' . $child->[1] . '"' . $child->[0]->data . '"' . "\x0A";
    } elsif ($nt == $child->[0]->COMMENT_NODE) {
      $r .= '| ' . $child->[1] . '<!-- ' . $child->[0]->data . " -->\x0A";
    } elsif ($nt == $child->[0]->DOCUMENT_TYPE_NODE) {
      $r .= '| ' . $child->[1] . '<!DOCTYPE ' . $child->[0]->name . ">\x0A";
    } else {
      $r .= '| ' . $child->[1] . $child->[0]->node_type . "\x0A"; # error
    }
  }
  
  return \$r;
} # test_serialize

sub get_node_path ($) {
  my $node = shift;
  my @r;
  while (defined $node) {
    my $rs;
    if ($node->node_type == 1) {
      $rs = $node->manakai_local_name;
      $node = $node->parent_node;
    } elsif ($node->node_type == 2) {
      $rs = '@' . $node->manakai_local_name;
      $node = $node->owner_element;
    } elsif ($node->node_type == 3) {
      $rs = '"' . $node->data . '"';
      $node = $node->parent_node;
    } elsif ($node->node_type == 9) {
      $rs = '';
      $node = $node->parent_node;
    } else {
      $rs = '#' . $node->node_type;
      $node = $node->parent_node;
    }
    unshift @r, $rs;
  }
  return join '/', @r;
} # get_node_path

=head1 AUTHOR

Wakaba <w@suika.fam.cx>.

=head1 LICENSE

Copyright 2007 Wakaba <w@suika.fam.cx>

This library is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

=cut

## $Date: 2007/05/25 14:24:31 $
