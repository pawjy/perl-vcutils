package RCSFormat::File;
use strict;
use warnings;
our $VERSION = '1.0';

sub new_from_stringref ($$) {
  my ($class, $sref) = @_;
  
  my $self = bless {}, $class;

  require RCSFormat;
  $self->{rcsformat} = RCSFormat->new;
  $self->{rcsformat}->parse_text ($sref);

  return $self;
} # new_from_stringref

sub revisions ($) {
  my $self = shift;
  my $rcs = $self->{rcsformat};

  require List::Rubyish;
  return $self->{revisions} ||= List::Rubyish->new
      ([$rcs->sort_by_revision (keys %{$rcs->{delta}})]);
} # revisions

sub get_revision_by_number ($$) {
  my ($self, $revnum) = @_;
  my $rcs = $self->{rcsformat};

  if ($rcs->{deltatext}->{$revnum}) {
    require RCSFormat::Revision;
    return RCSFormat::Revision->new ($rcs, $revnum);        
  } else {
    return undef;
  }
} # get_revision_by_number

1;
