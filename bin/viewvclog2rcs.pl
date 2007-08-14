#!/usr/bin/perl
use strict;

use lib qw[/home/httpd/html/www/markup/html/whatpm
           /home/wakaba/work/manakai2/lib
  ../lib
];

my $log_uri;

use Getopt::Long;
GetOptions (
  'log-uri=s' => \$log_uri,
);
die unless defined $log_uri;

my $diff_command = 'diff';
my $diff_options = ['--rcs', '-a'];

require Message::DOM::DOMImplementation;
my $dom = 'Message::DOM::DOMImplementation';

my $ent = get_remote_entity ($log_uri);
unless (defined $ent->{s}) {
  die "<$log_uri>: $ent->{error_status_text}";
}

require RCSFormat;

my $rcs = new RCSFormat;
$rcs->{admin}->{strict} = 1;
$rcs->{admin}->{comment} = '# ';
$rcs->{admin}->{expand} = 'b';

my $text = {};
my $text_from = {};

#if ($ent->{s} =~ m!<title>CVS log for ([^<>]+)</title>!gc) {
#  $info->{file_path} = htunescape ($1);
#}

my $branches = {};
my $branch_rev = {};
if ($ent->{s} =~ m[View only Branch]gc) {
  while ($ent->{s} =~ m[<option value="([^"]+)"|</select]gc) {
    last unless defined $1;
    $branches->{$1} = 1;
  }
}

pos ($ent->{s}) = 0;

REV: while ($ent->{s} =~ m!<hr size=1 noshade>!gc) {
  my $rev = '';
  if ($ent->{s} =~ m!Revision!gc and
      $ent->{s} =~ m!<a href="([^"]+)"\s*><b>([0-9.]+)</b></a>!gc) {
    my $uri = $dom->create_uri_reference ($1)
        ->get_absolute_reference ($log_uri)->uri_reference;
    $rev = $2;

    my $revent = get_remote_entity ($uri);
    if (defined $revent->{s}) {
      $text->{$rev} = $revent->{s};
    }

    unless (defined $rcs->{admin}->{head}) {
      $rcs->{admin}->{head} = $rev;      
      $rcs->{deltatext}->{$rev}->{text} = $text->{$rev};
    }
  }

  if ($ent->{s} =~ m!<i>\w+ (\w+)\s*(\d+)\s*(\d+):(\d+):(\d+) (\d+) UTC</i> \([^()]+\) by <i>([^<>]+)</i>!gc) {
    $rcs->{delta}->{$rev}->{date} = sprintf '%02d.%02d.%02d.%02d.%02d.%02d',
        $6, {
          Jan => '01', Feb => '02', Mar => '03', Apr => '04',
          May => '05', Jun => '06', Jul => '07', Aug => '08',
          Sep => '09', Oct => '10', Nov => '11', Dec => '12',
        }->{$1}, $2, $3, $4, $5;
    $rcs->{delta}->{$rev}->{author} = $7;
  }

  $ent->{s} =~ m[(?=<(?>br|pre)>)]gc;

  if ($ent->{s} =~ m[\G<br>Branch:((?>(?!<(?>[bh]r|pre)).)+)]gcs) {
    my $b = $1;
    while ($b =~ m!><b>([^<>]+)</b></a>!gc) {
      push @{$rcs->{delta}->{$rev}->{branches} ||= []}, $1
          unless $1 eq 'MAIN';
    }
    $ent->{s} =~ m[(?=<(?>br|pre)>)]gc;
  }

  if ($ent->{s} =~ m[\G<br>CVS Tags:((?>(?!<(?>[bh]r|pre)).)+)]gcs) {
    my $b = $1;
    while ($b =~ m!><b>([^<>]+)</b></a>!gc) {
      my $rev = $branches->{$1} ? "$rev.0.".((++$branch_rev->{$rev})*2) : $rev;
      push @{$rcs->{admin}->{symbols} ||= []}, [$1 => $rev]
          unless $1 eq 'HEAD'; ## TODO
    }
    $ent->{s} =~ m[(?=<(?>br|pre)>)]gc; 
  }

  if ($ent->{s} =~ m!\G<br>Changes since <b>([0-9.]+):!gc) {
    $rcs->{delta}->{$rev}->{next} = $1;
    $text_from->{$1} = $rev;
  }

  if ($ent->{s} =~ m!<pre>(.*?)</pre>!gcs) {
    $rcs->{deltatext}->{$rev}->{log} = htunescape ($1);
  }

  $rcs->{delta}->{$rev}->{state} = 'Exp';
} # REV

require File::Temp;
require IPC::Open2;
while (keys %$text_from) {
  my $rev = each %$text_from;
  if (defined $text->{$text_from->{$rev}}) {
    my $from_file = new File::Temp;
    binmode $from_file;
    $from_file->print ($text->{$text_from->{$rev}});
    my $to_file = new File::Temp;
    binmode $to_file;
    $to_file->print ($text->{$rev});
    my (undef, $diff_filemame) = File::Temp::tempfile
        ('DIFFXXXX', DIR => File::Temp::tempdir (), OPEN => 0);
    IPC::Open2::open2 (my $diffin, my $diffout,
                       $diff_command, @{$diff_options},
                       $from_file->filename => $to_file->filename)
        or die "$0: $diff_command: $!";
    binmode $diffin;
    local $/ = undef;
    $rcs->{deltatext}->{$rev}->{text} = <$diffin>;
    delete $text_from->{$rev};
  }
}

print $rcs->stringify;

sub htunescape ($) {
  my $s = shift;
  $s =~ s!<[^<>]+>!!g;
  $s =~ s/&lt;/</g;
  $s =~ s/&gt;/>/g;
  $s =~ s/&amp;/&/g;
  return $s;
} # htunescape

sub get_remote_entity ($) {
  my $request_uri = $_[0];
  my $r = {};

    my $uri = $dom->create_uri_reference ($request_uri);
    unless ({
             http => 1,
            }->{lc $uri->uri_scheme}) {
      return {uri => $request_uri, request_uri => $request_uri,
              error_status_text => 'URI scheme not allowed'};
    }

    require Message::Util::HostPermit;
    my $host_permit = new Message::Util::HostPermit;
    $host_permit->add_rule (<<EOH);
Allow host=suika port=80
Deny host=suika
Allow host=suika.fam.cx port=80
Deny host=suika.fam.cx
Deny host=localhost
Deny host=*.localdomain
Deny ipv4=0.0.0.0/8
Deny ipv4=10.0.0.0/8
Deny ipv4=127.0.0.0/8
Deny ipv4=169.254.0.0/16
Deny ipv4=172.0.0.0/11
Deny ipv4=192.0.2.0/24
Deny ipv4=192.88.99.0/24
Deny ipv4=192.168.0.0/16
Deny ipv4=198.18.0.0/15
Deny ipv4=224.0.0.0/4
Deny ipv4=255.255.255.255/32
Deny ipv6=0::0/0
Allow host=*
EOH
    unless ($host_permit->check ($uri->uri_host, $uri->uri_port || 80)) {
      return {uri => $request_uri, request_uri => $request_uri,
              error_status_text => 'Connection to the host is forbidden'};
    }

    require LWP::UserAgent;
    my $ua = WDCC::LWPUA->new;
    $ua->{wdcc_dom} = $dom;
    $ua->{wdcc_host_permit} = $host_permit;
    $ua->agent ('Mozilla'); ## TODO: for now.
    $ua->parse_head (0);
    $ua->protocols_allowed ([qw/http/]);
    $ua->max_size (1000_000);
    my $req = HTTP::Request->new (GET => $request_uri);
    my $res = $ua->request ($req);
    ## TODO: 401 sets |is_success| true.
    if ($res->is_success) {
      $r->{base_uri} = $res->base; ## NOTE: It does check |Content-Base|, |Content-Location|, and <base>. ## TODO: Use our own code!
      $r->{uri} = $res->request->uri;
      $r->{request_uri} = $request_uri;

      ## TODO: More strict parsing...
      my $ct = $res->header ('Content-Type');
      if (defined $ct and $ct =~ m#^([0-9A-Za-z._+-]+/[0-9A-Za-z._+-]+)#) {
        $r->{media_type} = lc $1;
      }
      if (defined $ct and $ct =~ /;\s*charset\s*=\s*"?(\S+)"?/i) {
        $r->{charset} = lc $1;
        $r->{charset} =~ tr/\\//d;
      }

      $r->{s} = ''.$res->content;
    } else {
      $r->{uri} = $res->request->uri;
      $r->{request_uri} = $request_uri;
      $r->{error_status_text} = $res->status_line;
    }

    $r->{header_field} = [];
    $res->scan (sub {
      push @{$r->{header_field}}, [$_[0], $_[1]];
    });
    $r->{header_status_code} = $res->code;
    $r->{header_status_text} = $res->message;

  return $r;
} # get_remote_entity

package WDCC::LWPUA;
BEGIN { push our @ISA, 'LWP::UserAgent'; }

sub redirect_ok {
  my $ua = shift;
  unless ($ua->SUPER::redirect_ok (@_)) {
    return 0;
  }

  my $uris = $_[1]->header ('Location');
  return 0 unless $uris;
  my $uri = $ua->{wdcc_dom}->create_uri_reference ($uris);
  unless ({
           http => 1,
          }->{lc $uri->uri_scheme}) {
    return 0;
  }
  unless ($ua->{wdcc_host_permit}->check ($uri->uri_host, $uri->uri_port || 80)) {
    return 0;
  }
  return 1;
} # redirect_ok
