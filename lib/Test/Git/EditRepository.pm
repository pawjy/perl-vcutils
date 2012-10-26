package Test::Git::EditRepository;
use strict;
use warnings;
use Exporter::Lite;
use File::Temp qw(tempdir);
use Path::Class;

our @EXPORT;

my $temp_dir = tempdir 'TESTGITER-XX'.'XX'.'XX', TMPDIR => 1, CLEANUP => 1;
my $temp_d = dir($temp_dir);

push @EXPORT, qw(create_git_repository);
sub create_git_repository (;%) {
    my %args = @_;

    my $repo_d = $temp_d->subdir('git-' . rand 100000);
    $repo_d->mkpath;
    system "cd \Q$repo_d\E && git init > /dev/null";

    return $repo_d;
}

push @EXPORT, qw(create_git_files);
sub create_git_files ($@) {
    no warnings 'uninitialized';
    no warnings 'utf8';
    my $d = shift;
    for (@_) {
        my $f = $d->file($_->{name});
        $f->dir->mkpath;
        print { $f->openw } $_->{data};
        system "cd \Q$d\E && git add \Q$_->{name}\E";
    }
}

push @EXPORT, qw(git_commit);
sub git_commit ($;%) {
    my ($d, %args) = @_;
    my $msg = $args{message} || rand;
    return 0 == (system "cd \Q$d\E && git commit -m \Q$msg\E > /dev/null");
}

push @EXPORT, qw(get_git_revision);
sub get_git_revision ($) {
    my $d = shift;
    my $rev = `cd \Q$d\E && git rev-parse HEAD 2> /dev/null`;
    chomp $rev if defined $rev;
    return undef if $rev eq 'HEAD';
    return $rev;
}

push @EXPORT, qw(git_checkout);
sub git_checkout ($$) {
    my ($d, $ref) = @_;
    return (system "cd \Q$d\E && git checkout \Q$ref\E 2> /dev/null") == 0;
}

1;
