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

sub rawdata ($) {
  return $_[0]->{rcsformat}->{deltatext}->{$_[0]->{number}}->{text};
} # rawdata

1;
