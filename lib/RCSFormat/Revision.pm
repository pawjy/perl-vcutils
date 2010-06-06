package RCSFormat::Revision;
use strict;
use warnings;
our $VERSION = '1.0';

sub new ($$$) {
  my ($class, $rcsformat, $revnum) = @_;
  return bless {
    number => $revnum,
    rcsformat => $rcsformat,
  }, $class;
} # new

sub file ($) {
  require RCSFormat::File;
  return RCSFormat::File->new_from_rcsformat ($_[0]->{rcsformat});
} # file

sub number ($) {
  return $_[0]->{number};
} # number

sub next_revision_number ($) {
  return $_[0]->{rcsformat}->{delta}->{$_[0]->{number}}->{next};
} # next_revision_number

sub rawdate ($) {
  return $_[0]->{rcsformat}->{delta}->{$_[0]->{number}}->{date};
} # rawdate

sub date_as_epoch ($) {
  require RCSFormat::Date;
  return RCSFormat::Date::rcsdate_to_epoch ($_[0]->rawdate);
} # date_as_epoch

sub date_as_rcs_formatted ($) {
  require RCSFormat::Date;
  return RCSFormat::Date::epoch_to_rcs_formatted_date ($_[0]->date_as_epoch);
} # date_as_rcs_formatted

sub author ($) {
  return $_[0]->{rcsformat}->{delta}->{$_[0]->{number}}->{author};
} # author

sub log ($) {
  return $_[0]->{rcsformat}->{deltatext}->{$_[0]->{number}}->{log};
} # log

sub rawdata ($) {
  return $_[0]->{rcsformat}->{deltatext}->{$_[0]->{number}}->{text};
} # rawdata

sub _replace_keywords ($$) {
  my $self = shift;
  $_[0] =~ s{\$Date:[^\$]*\$}
      {q{$Date: }.($self->date_as_rcs_formatted).q{ $}}ge;
  $_[0] =~ s{\$Revision:[^\$]*\$}{q{$Revision: }.$self->number.q{ $}}ge;
}

sub data ($) {
  my $self = shift;
  return $self->{data} if exists $self->{data};
  
  my $route = $self->file->find_route_to_revision ($self->number);
  return $self->{data} = undef unless @$route;

  my $rcs = $self->{rcsformat};
  $self->{data} = $rcs->{deltatext}->{shift @$route}->{text};

  require RCSFormat::Diff;
  while (@$route) {
    my $diff = $rcs->{deltatext}->{shift @$route}->{text};
    RCSFormat::Diff::apply_rcs_diff (\($self->{data}), \$diff);
  }

  $self->_replace_keywords ($self->{data});
  return $self->{data};
} # data

1;

=head1 LICENSE

Copyright 2010 Wakaba <w@suika.fam.cx>.  All rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
