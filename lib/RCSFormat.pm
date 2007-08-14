
=head1 NAME

RCSFormat - Low-level Interface to RCS Format

=head1 DESCRIPTION

RCS format is widely used to manage revision history of files by tools such as
RCS and CVS.  This module provides some low-level interface to RCS format.

=cut

package RCSFormat;
use strict;
our $VERSION=do{my @r=(q$Revision: 1.2 $=~/\d+/g);sprintf "%d."."%02d" x $#r,@r};

sub new ($;%) {
  my $self = bless {}, shift;
  $self;
}

{
my $WSP = qr/[\x08-\x0D\x20]+/;
my $NUM = qr/[0-9.]+/;
my $IDNONUM = qr/[^\x08-\x0D\x200-9\$,:;\@]+/;
my $SYM = qr/[^\x08-\x0D\x20\$,.:;\@]+/;
my $STR = qr/\@[^\@]*(?>[^\@]+|\@\@)*\@/;
sub parse_text ($$;%) {
  my ($self, $s) = @_;
  $s = \$_[1] unless ref $s;
  delete $self->{admin};
  delete $self->{desc};
  delete $self->{delta};
  
  $$s =~ /\G$WSP/gco;
  ## admin
  $self->___parse_fields ($s, hash => $self->{admin} ||= {}, context => 'admin');
  $self->{admin}->{access} ||= [];
  $self->{admin}->{symbols} ||= [];
  $self->{admin}->{locks} ||= [];
  
  ## delta
  unless (exists $self->{desc}) {
  while ($$s =~ /\G($NUM)/gco) {
    my $rev = $1;
    $$s =~ /\G$WSP/gco;
    $self->___parse_fields ($s, hash => $self->{delta}->{$rev} ||= {}, context => qq'delta[$rev]');
    $self->{delta}->{$rev}->{branches} ||= [];
    last if exists $self->{desc};
  }}
  
  ## deltatext
  while ($$s =~ /\G($NUM)/gco) {
    my $rev = $1;
    $$s =~ /\G$WSP/gco;
    $self->___parse_fields ($s, hash => $self->{deltatext}->{$rev} ||= {}, context => qq'deltatext[$rev]');
  }
}

sub ___parse_fields ($$%) {
  my ($self, $s, %opt) = @_;
  while ($$s =~ /\G((?>$NUM)?$IDNONUM(?>$IDNONUM|$NUM)*)/gco) {
    my $keyword = $1;
    $$s =~ /\G$WSP/gco;
    if ({qw/desc 1 log 1 text 1/}->{$keyword}) {
      warn "$opt{cotnext}/$keyword: invalid" if $keyword eq 'desc' and exists $self->{$keyword};
      if ($$s =~ /\G($STR)/gco) {
        my $t = $1;
        $t =~ s/^\@//;
        $t =~ s/\@$//;
        $t =~ s/\@\@/\@/g;
        ($keyword eq 'desc' ? $self->{desc} : $opt{hash}->{$keyword}) = $t;
      } else {
        warn "$keyword: value required";
        ($keyword eq 'desc' ? $self->{desc} : $opt{hash}->{$keyword}) = "";
      }
      $$s =~ /\G$WSP/gco;
      ($keyword eq 'desc' ? return : next);
    } elsif ($$s =~ /\G([^;\@]*(?>[^;\@]+|$STR)*)/gco) {
      my $val = $1;
      $val =~ /$WSP$/o;
      if (exists $opt{hash}->{$keyword}) {
        warn "$opt{context}/$keyword: duplicate";
      }
      $opt{hash}->{$keyword} = length $val ? $val : undef;
    } else {
      $opt{hash}->{$keyword} = undef;
    }
    if ({qw/symbols 1 locks 1/}->{$keyword}) {
      $opt{hash}->{$keyword} = [map {[split /(?:$WSP)?:(?:$WSP)?/]} split m#$WSP#o, $opt{hash}->{$keyword}];
    } elsif ({qw/comment 1 expand 1/}->{$keyword}) {
      $opt{hash}->{$keyword} =~ s/^\@//;
      $opt{hash}->{$keyword} =~ s/\@$//;
      $opt{hash}->{$keyword} =~ s/\@\@/\@/g;
    } elsif ({qw/access 1 branches 1/}->{$keyword}) {
      $opt{hash}->{$keyword} = [split m#$WSP#o, $opt{hash}->{$keyword}];
    }
    if ($$s =~ /\G[^;]+/gc) {
      warn "$opt{context}/$keyword: extra data";
    }
    $$s =~ /\G;/gc or warn "$opt{context}/$keyword: semicoron required";
    $$s =~ /\G$WSP/gco;
  }
}
}

sub stringify ($;%) {
  my $self = shift;
  my $s = '';
  
  ## admin
  $s .= qq(head	)
     .  $self->___stringify_value ($self->{admin}->{head}, type => 'number',
                                   min => 0, max => 1)
     .  ";\x0A";
  if (exists $self->{admin}->{branch}) {
    $s .= qq(branch	)
       .  $self->___stringify_value ($self->{admin}->{branch}, type => 'num',
                                     min => 0, max => 1)
       .  ";\x0A";
  }
  if (defined $self->{admin}->{access}) {
    $s .= qq(access	)
       .  $self->___stringify_value ($self->{admin}->{access}, type => 'id',
                                     min => 0, max => -1)
       .  ";\x0A";
  } else {
    $s .= qq(access;\x0A);
  }
  $s .= qq(symbols);
  for (@{$self->{admin}->{symbols}}) {
     $s .= "\x0A\t"
        .  $self->___stringify_value ($_->[0], type => 'sym',
                                      min => 1, max => 1)
        .  ':'
        .  $self->___stringify_value ($_->[1], type => 'num',
                                      min => 1, max => 1);
  }
  $s .= ";\x0A";
  $s .= qq(locks);
  for (@{$self->{admin}->{locks}}) {
     $s .= "\x0A\t"
        .  $self->___stringify_value ($_->[0], type => 'id',
                                      min => 1, max => 1)
        .  ':'
        .  $self->___stringify_value ($_->[1], type => 'num',
                                      min => 1, max => 1);
  }
  $s .= ";";
  $s .= " strict;" if exists $self->{admin}->{strict};
  $s .= "\x0A";
  if (exists $self->{admin}->{comment}) {
    $s .= qq(comment	)
       .  $self->___stringify_value ($self->{admin}->{comment}, type => 'str',
                                     min => 0, max => 1)
       .  ";\x0A";
  }
  if (exists $self->{admin}->{expand}) {
    $s .= qq(expand	)
       .  $self->___stringify_value ($self->{admin}->{expand}, type => 'str',
                                     min => 0, max => 1)
       .  ";\x0A";
  }
  for (grep !{qw/head 1 branch 1 access 1 symbols 1 locks 1 strict 1 comment 1 expand 1/}->{$_},
       keys %{$self->{admin}}) {
    $s .= qq($_	)
       .  $self->___stringify_value ($self->{admin}->{$_})
       .  ";\x0A";
  }
  $s .= "\x0A";
  
  ## delta
  for my $rev ($self->sort_by_revision (keys %{$self->{delta}})) {
    $s .= "\x0A$rev\x0A";
    $s .= qq(date	)
       .  $self->___stringify_value ($self->{delta}->{$rev}->{date}, type => 'num',
                                     min => 1, max => 1)
       .  ";\t";
    $s .= qq(author )
       .  $self->___stringify_value ($self->{delta}->{$rev}->{author}, type => 'id',
                                     min => 1, max => 1)
       .  ";\t";
    $s .= qq(state )
       .  $self->___stringify_value ($self->{delta}->{$rev}->{state}, type => 'id',
                                     min => 0, max => 1)
       .  ";\x0A";
    $s .= qq(branches)
       .  $self->___stringify_value ($self->{delta}->{$rev}->{branches}, type => 'num',
                                     min => 0, max => -1)
       .  ";\x0A";
    $s .= qq(next	)
       .  $self->___stringify_value ($self->{delta}->{$rev}->{next}, type => 'num',
                                     min => 0, max => 1)
       .  ";\x0A";
    for (grep !{qw/date 1 author 1 state 1 branches 1 next 1/}->{$_},
         keys %{$self->{delta}->{$rev}}) {
      $s .= qq($_	)
         .  $self->___stringify_value ($self->{delta}->{$rev}->{$_})
         .  ";\x0A";
    }
  }
  
  # desc
  $s .= qq(\x0A\x0Adesc\x0A)
     .  $self->___stringify_value ($self->{desc}, type => 'str',
                                   min => 1, max => 1)
     .  "\x0A";
  
  ## deltatext
  for my $rev ($self->sort_by_revision (keys %{$self->{deltatext}})) {
    $s .= "\x0A\x0A$rev\x0A";
    $s .= qq(log\x0A)
       .  $self->___stringify_value ($self->{deltatext}->{$rev}->{log}, type => 'str',
                                     min => 1, max => 1)
       .  "\x0A";
    $s .= qq(text\x0A)
       .  $self->___stringify_value ($self->{deltatext}->{$rev}->{text}, type => 'str',
                                     min => 1, max => 1)
       .  "\x0A";
    for (grep !{qw/log 1 text 1/}->{$_},
         keys %{$self->{deltatext}->{$rev}}) {
      $s .= qq($_	)
         .  $self->___stringify_value ($self->{deltatext}->{$rev}->{$_})
         .  ";\x0A";
    }
  }
  $s .= "\x0A" if keys %{$self->{deltatext}} > 1;
  
  $s;
}

sub ___stringify_value ($$%) {
  my ($self, $s, %opt) = @_;
  if ($opt{type} eq 'str') {
    $s =~ s/\@/\@\@/g;
    return "\@$s\@";
  } elsif ($opt{max} == -1 or $opt{max} > 1) {
    my $t = '';
    for (@{$s}) {
      $t .= "\x0A\t" . $_;
    }
    return $t;
  } else {
    return $s;
  }
}

sub sort_by_revision ($@) {
  shift;
  map {
    $_->[0]
  }
  sort {
    my $r;
    for my $i (0..$#{$a->[1]}) {
      $r = $b->[1]->[$i] <=> $a->[1]->[$i];
      return $r if $r;
    }
    0;
  }
  map {
    [$_, [split /\./, $_]]
  }
  @_;
}

=head1 SEE ALSO

rcsfile(5)

=head1 LICENSE

Copyright 2004 Wakaba <w@suika.fam.cx>.  All rights reserved.

This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.

=cut

1; # $Date: 2007/08/14 09:52:34 $
