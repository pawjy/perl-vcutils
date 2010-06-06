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

sub new_from_rcsformat ($$) {
  #my ($class, $rcsformat) = @_;
  return bless {rcsformat => $_[1]}, $_[0];
} # new_from_rcsformat

sub file_name ($) {
  if (@_ > 1) {
    $_[0]->{file_name} = $_[1];
  }
  return $_[0]->{file_name};
} # file_name

sub revision_numbers ($) {
  my $self = shift;
  my $rcs = $self->{rcsformat};

  require List::Rubyish;
  return $self->{revision_numbers} ||= List::Rubyish->new
      ([$rcs->sort_by_revision (keys %{$rcs->{delta}})]);
} # revision_numbers

sub revision_numbers_sorted_by_date ($) {
  my $self = shift;
  my $rcs = $self->{rcsformat};

  require List::Rubyish;
  return List::Rubyish->new ([keys %{$rcs->{delta}}])
      ->map (sub { [$rcs->{delta}->{$_}->{date}, $_] })
      ->sort (sub { $_[1]->[0] cmp $_[0]->[0] }) ## Y10K buggy!!!
      ->map (sub { $_->[1] });
} # revision_numbers_sorted_by_date

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

sub _traverse_revision_routes ($) {
  my $self = shift;
  my $rcs = $self->{rcsformat};
  return if $rcs->{routes_to_revisions};

  my $routes = {};
  my $prev = {};

  my @s;
  push @s, [$rcs->{admin}->{head}, [], 0];
  while (@s) {
    my $s = shift @s;
    my $rev = $s->[0] or next;
    next if $routes->{$rev};

    $routes->{$rev} = [@{$s->[1]}, $rev];

    my $delta = $rcs->{delta}->{$rev};
    if ($delta) {
      if ($delta->{next}) {
        push @s, [$delta->{next}, $routes->{$rev}, $s->[2]];
        if ($s->[2]) { ## In branch
          $prev->{$delta->{next}} = $rev;
        } else {
          $prev->{$rev} = $delta->{next};
        }
      }

      for (@{$delta->{branches} or []}) {
        push @s, [$_, $routes->{$rev}, 1];
        $prev->{$_} = $rev;
      }
    }
  }

  $rcs->{routes_to_revisions} = $routes;
  $rcs->{prev_revision_number} = $prev;
}

sub find_route_to_revision ($$) {
  my $self = shift;
  my $rcs = $self->{rcsformat};

  $self->_traverse_revision_routes;
  return $rcs->{routes_to_revisions}->{$_[0]} || [];
} # find_route_to_revision

sub get_prev_revision_number_of ($$) {
  my ($self, $next_rev) = @_;
  my $rcs = $self->{rcsformat};

  $self->_traverse_revision_routes;
  return $rcs->{prev_revision_number}->{$next_rev}; # or undef
} # get_prev_revision_number_of

sub get_unified_diff_between ($$$) {
  my ($self, $rev1, $rev2) = @_;

  my $file_name = $self->file_name;
  $file_name = defined $file_name ? $file_name . ' ' : '';
  
  my $name1 = $file_name . 'r' . ($rev1 ? $rev1->number : '0');
  my $data1 = $rev1 ? $rev1->data : '';
  my $mtime1 = $rev1 ? $rev1->date_as_epoch : undef;

  my $name2 = $file_name . 'r' . ($rev2 ? $rev2->number : '0');
  my $data2 = $rev2 ? $rev2->data : '';
  my $mtime2 = $rev2 ? $rev2->date_as_epoch : undef;

  require Text::Diff;
  return Text::Diff::diff
      (\$data1, \$data2, {
        FILENAME_A => $name1, FILENAME_B => $name2,
        MTIME_A => $mtime1, MTIME_B => $mtime2,
      });
} # get_unified_diff_between

1;
