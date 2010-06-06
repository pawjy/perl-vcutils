package RCSFormat::Converter::Atom;
use strict;
use warnings;
our $VERSION = '1.0';

use Exporter::Lite;
our @EXPORT = qw(
    rcs_to_atom_feed
);

sub ATOM_NS () { q<http://www.w3.org/2005/Atom> }

sub rcs_to_atom_feed ($) {
  my $rcs = shift;
  
  require Message::DOM::DOMImplementation;
  my $dom = Message::DOM::DOMImplementation->new;

  my $title = $rcs->file_name;
  $title = '' unless defined $title;
  my $id = 'file:///' . $title;
  my $lang = '';
  my $doc = $dom->create_atom_feed_document ($id, $title, $lang);
  $doc->dom_config->set_parameter (q<http://suika.fam.cx/www/2006/dom-config/create-child-element> => 1);

  my $feed = $doc->document_element;
  $feed->set_attribute_ns (q<http://www.w3.org/2000/xmlns/>, 'xmlns', ATOM_NS);
  $feed->set_attribute_ns (q<http://www.w3.org/2000/xmlns/>, 'xmlns:html', q<http://www.w3.org/1999/xhtml>);

  ## This is meaningless, but still is necessary for Atom conformance:-<
  my $link = $doc->create_element_ns (ATOM_NS, 'link');
  $link->rel ('self');
  $link->type ('application/atom+xml');
  $link->href ('');
  $feed->append_child ($link);

  my $updated;
  my $num_to_rev = {};
  $rcs->revision_numbers_sorted_by_date->reverse->each (sub {
    my $rev = $num_to_rev->{$_} ||= $rcs->get_revision_by_number ($_);
    my $id = $id . '?revision=' . $rev->number;
    my $title = 'r' . $rev->number;
    my $entry = $feed->add_new_entry ($id, $title, '');

    my $author = $doc->create_element_ns (ATOM_NS, 'author');
    $author->name ($rev->author);
    $entry->append_child ($author);

    $updated = $rev->date_as_epoch;
    $entry->updated_element->value ($updated);

    my $content = $entry->content_element;
    $content->type ('xhtml');

    my $prev = $rcs->get_prev_revision_number_of ($rev->number);
    my $prev_rev;
    $prev_rev = $num_to_rev->{$prev} ||= $rcs->get_revision_by_number ($prev)
        if defined $prev;
    my $div = $content->container;
    $div->inner_html (q<<pre class="log"></pre><pre class="diff"></pre>>);
    $div->first_child->text_content ($rev->log);
    $div->last_child->text_content
        ($rcs->get_unified_diff_between ($prev_rev => $rev));
  });

  $feed->updated_element->value ($updated);

  return $doc;
} # rcs_to_atom_feed

1;
