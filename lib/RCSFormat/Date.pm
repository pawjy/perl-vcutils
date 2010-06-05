package RCSFormat::Date;
use strict;
use warnings;
our $VERSION = '1.0';

use Exporter::Lite;
our @EXPORT = qw(
    rcsdate_to_epoch
    epoch_to_rcsdate
    epoch_to_rcs_formatted_date
);

sub rcsdate_to_epoch ($) {
  my $d = $_[0] || '';
  if ($d =~ /^([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)$/) {
    require Time::Local;
    return Time::Local::timegm_nocheck ($6, $5, $4, $3, $2 - 1, $1);
  } else {
    return 0;
  }
} # rcsdate_to_epoch

sub epoch_to_rcsdate ($) {
  my ($s, $min, $h, $d, $m, $y) = gmtime $_[0];
  $y += 1900;
  $m++;
  return sprintf '%02d.%02d.%02d.%02d.%02d.%02d', $y, $m, $d, $h, $min, $s;
} # epoch_to_rcsdate

sub epoch_to_rcs_formatted_date ($) {
  my ($s, $min, $h, $d, $m, $y) = gmtime $_[0];
  $y += 1900;
  $m++;
  return sprintf '%04d/%02d/%02d %02d:%02d:%02d', $y, $m, $d, $h, $min, $s;
} # epoch_to_rcs_formatted_date

1;
