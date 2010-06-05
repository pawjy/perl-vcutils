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

sub number ($) {
  return $_[0]->{number};
} # number

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
  
  my $rawdata = $self->rawdata;
  $self->_replace_keywords ($rawdata);
  return $rawdata;
} # data

1;
