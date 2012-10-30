use strict;
BEGIN {
    my $file_name = __FILE__; $file_name =~ s{[^/\\]+$}{}; $file_name ||= '.';
    $file_name .= '/../config/perl/libs.txt';
    if (-f $file_name) {
        open my $file, '<', $file_name or die "$0: $file_name: $!";
        unshift @INC, split /:/, <$file>;
    }
    $file_name =~ s{/config/perl/libs.txt$}{/t_deps/modules/*/lib};
    unshift @INC, glob $file_name;
}
use warnings;
use Test::More;
use Test::Differences;
use Test::X1;
use AnyEvent;
use File::Temp qw(tempdir);
use Path::Class;
use AnyEvent::Git::Repository;

test {
    my $c = shift;

    my $temp_d = dir(tempdir(CLEANUP => 1));
    system "cd $temp_d && git init && echo 'hoge:\n\techo 1234 > foo.txt' > Makefile && git add Makefile && git commit -m New";
    my $rev = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev;

    system "cd $temp_d && touch aaa && git add aaa && git commit -m rev2";
    my $rev2 = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev2;

    my $cached_d = dir(tempdir(CLEANUP => 1));

    my $action = AnyEvent::Git::Repository->new_from_url_and_cached_repo_set_d($temp_d->stringify, $cached_d);
    $action->clone_as_cv->cb(sub {
        my $branches = $_[0]->recv;
        test {
            my $d = $action->temp_repo_d;
            ok -f $d->file('Makefile');
            ok -f $d->file('aaa');
            my $rev3 = `cd \Q$d\E && git rev-parse HEAD`;
            $rev3 =~ s/\s+$//;
            is $rev3, $rev2;
            my $branch = `cd \Q$d\E && git symbolic-ref HEAD 2> /dev/null`;
            is $branch, "refs/heads/master\n";
            my $remote_branch = `cd \Q$d\E && git config branch.master.merge`;
            is $remote_branch, "refs/heads/master\n";
            my $remote = `cd \Q$d\E && git config branch.master.remote`;
            is $remote, "origin\n";
            done $c;
            undef $c;
        } $c;
    });
} n => 6, name => 'default';

test {
    my $c = shift;

    my $temp_d = dir(tempdir(CLEANUP => 1));
    system "cd $temp_d && git init && echo 'hoge:\n\techo 1234 > foo.txt' > Makefile && git add Makefile && git commit -m New";
    my $rev = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev;

    system "cd $temp_d && touch aaa && git add aaa && git commit -m rev2";
    my $rev2 = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev2;

    my $cached_d = dir(tempdir(CLEANUP => 1));

    my $action = AnyEvent::Git::Repository->new_from_url_and_cached_repo_set_d($temp_d->stringify, $cached_d);
    $action->revision($rev);
    $action->clone_as_cv->cb(sub {
        my $branches = $_[0]->recv;
        test {
            my $d = $action->temp_repo_d;
            ok -f $d->file('Makefile');
            ok !-f $d->file('aaa');
            my $rev3 = `cd \Q$d\E && git rev-parse HEAD`;
            $rev3 =~ s/\s+$//;
            is $rev3, $rev;
            my $branch = `cd \Q$d\E && git symbolic-ref HEAD 2> /dev/null`;
            is $branch, "";
            my $remote_branch = `cd \Q$d\E && git config branch.master.merge`;
            is $remote_branch, "refs/heads/master\n";
            my $remote = `cd \Q$d\E && git config branch.master.remote`;
            is $remote, "origin\n";
            done $c;
            undef $c;
        } $c;
    });
} n => 6, name => 'rev specified';

test {
    my $c = shift;

    my $temp_d = dir(tempdir(CLEANUP => 1));
    system "cd $temp_d && git init && echo 'hoge:\n\techo 1234 > foo.txt' > Makefile && git add Makefile && git commit -m New";
    my $rev = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev;

    system "cd $temp_d && git checkout -b hoge";

    system "cd $temp_d && touch aaa && git add aaa && git commit -m rev2";
    my $rev2 = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev2;

    my $cached_d = dir(tempdir(CLEANUP => 1));

    my $action = AnyEvent::Git::Repository->new_from_url_and_cached_repo_set_d($temp_d->stringify, $cached_d);
    $action->branch('hoge');
    $action->clone_as_cv->cb(sub {
        my $branches = $_[0]->recv;
        test {
            my $d = $action->temp_repo_d;
            ok -f $d->file('Makefile');
            ok -f $d->file('aaa');
            my $rev3 = `cd \Q$d\E && git rev-parse HEAD`;
            $rev3 =~ s/\s+$//;
            is $rev3, $rev2;
            my $branch = `cd \Q$d\E && git symbolic-ref HEAD 2> /dev/null`;
            is $branch, "refs/heads/hoge\n";
            my $remote_branch = `cd \Q$d\E && git config branch.master.merge`;
            is $remote_branch, "";
            my $remote = `cd \Q$d\E && git config branch.master.remote`;
            is $remote, "";
            my $remote_branch2 = `cd \Q$d\E && git config branch.hoge.merge`;
            is $remote_branch2, "refs/heads/hoge\n";
            my $remote2 = `cd \Q$d\E && git config branch.hoge.remote`;
            is $remote2, "origin\n";
            done $c;
            undef $c;
        } $c;
    });
} n => 8, name => 'branch specified';

test {
    my $c = shift;

    my $temp_d = dir(tempdir(CLEANUP => 1));
    system "cd $temp_d && git init && echo 'hoge:\n\techo 1234 > foo.txt' > Makefile && git add Makefile && git commit -m New";
    my $rev = `cd $temp_d && git rev-parse HEAD`;
    $rev =~ s/\s+$//;

    system "cd $temp_d && git checkout -b hoge";

    system "cd $temp_d && touch aaa && git add aaa && git commit -m rev2";
    my $rev2 = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev2;

    my $cached_d = dir(tempdir(CLEANUP => 1));

    my $action = AnyEvent::Git::Repository->new_from_url_and_cached_repo_set_d($temp_d->stringify, $cached_d);
    $action->branch('master');
    $action->clone_as_cv->cb(sub {
        my $branches = $_[0]->recv;
        test {
            my $d = $action->temp_repo_d;
            ok -f $d->file('Makefile');
            ok !-f $d->file('aaa');
            my $rev3 = `cd \Q$d\E && git rev-parse HEAD`;
            $rev3 =~ s/\s+$//;
            is $rev3, $rev;
            my $branch = `cd \Q$d\E && git symbolic-ref HEAD 2> /dev/null`;
            is $branch, "refs/heads/master\n";
            my $remote_branch = `cd \Q$d\E && git config branch.master.merge`;
            is $remote_branch, "refs/heads/master\n";
            my $remote = `cd \Q$d\E && git config branch.master.remote`;
            is $remote, "origin\n";
            my $remote_branch2 = `cd \Q$d\E && git config branch.hoge.merge`;
            is $remote_branch2, "refs/heads/hoge\n";
            my $remote2 = `cd \Q$d\E && git config branch.hoge.remote`;
            is $remote2, "origin\n";
            done $c;
            undef $c;
        } $c;
    });
} n => 8, name => 'branch specified 2';

test {
    my $c = shift;

    my $temp_d = dir(tempdir(CLEANUP => 1));
    system "cd $temp_d && git init && echo 'hoge:\n\techo 1234 > foo.txt' > Makefile && git add Makefile && git commit -m New";
    my $rev = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev;

    system "cd $temp_d && git checkout hoge";

    system "cd $temp_d && touch aaa && git add aaa && git commit -m rev2";
    my $rev2 = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev2;

    my $cached_d = dir(tempdir(CLEANUP => 1));

    my $action = AnyEvent::Git::Repository->new_from_url_and_cached_repo_set_d($temp_d->stringify, $cached_d);
    $action->branch('hoge');
    $action->revision($rev);
    $action->clone_as_cv->cb(sub {
        my $branches = $_[0]->recv;
        test {
            my $d = $action->temp_repo_d;
            ok -f $d->file('Makefile');
            ok !-f $d->file('aaa');
            my $rev3 = `cd \Q$d\E && git rev-parse HEAD`;
            $rev3 =~ s/\s+$//;
            is $rev3, $rev;
            my $branch = `cd \Q$d\E && git symbolic-ref HEAD 2> /dev/null`;
            is $branch, "refs/heads/hoge\n";
            my $remote_branch = `cd \Q$d\E && git config branch.master.merge`;
            is $remote_branch, "refs/heads/master\n";
            my $remote = `cd \Q$d\E && git config branch.master.remote`;
            is $remote, "origin\n";
            my $remote_branch2 = `cd \Q$d\E && git config branch.hoge.merge`;
            is $remote_branch2, "refs/heads/hoge\n";
            my $remote2 = `cd \Q$d\E && git config branch.hoge.remote`;
            is $remote2, "origin\n";
            done $c;
            undef $c;
        } $c;
    });
} n => 8, name => 'branch rev specified';

test {
    my $c = shift;

    my $temp_d = dir(tempdir(CLEANUP => 1));
    system "cd $temp_d && git init && echo 'hoge:\n\techo 1234 > foo.txt' > Makefile && git add Makefile && git commit -m New";
    my $rev = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev;
    $rev =~ s/\s+$//;

    system "cd $temp_d && git checkout hoge";

    system "cd $temp_d && touch aaa && git add aaa && git commit -m rev2";
    my $rev2 = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev2;

    my $cached_d = dir(tempdir(CLEANUP => 1));

    my $action = AnyEvent::Git::Repository->new_from_url_and_cached_repo_set_d($temp_d->stringify, $cached_d);
    $action->branch('master');
    $action->revision($rev);
    $action->clone_as_cv->cb(sub {
        my $branches = $_[0]->recv;
        test {
            my $d = $action->temp_repo_d;
            ok -f $d->file('Makefile');
            ok !-f $d->file('aaa');
            my $rev3 = `cd \Q$d\E && git rev-parse HEAD`;
            $rev3 =~ s/\s+$//;
            is $rev3, $rev;
            my $branch = `cd \Q$d\E && git symbolic-ref HEAD 2> /dev/null`;
            is $branch, "refs/heads/master\n";
            my $remote_branch = `cd \Q$d\E && git config branch.master.merge`;
            is $remote_branch, "refs/heads/master\n";
            my $remote = `cd \Q$d\E && git config branch.master.remote`;
            is $remote, "origin\n";
            my $remote_branch2 = `cd \Q$d\E && git config branch.hoge.merge`;
            is $remote_branch2, "";
            my $remote2 = `cd \Q$d\E && git config branch.hoge.remote`;
            is $remote2, "";
            done $c;
            undef $c;
        } $c;
    });
} n => 8, name => 'branch rev specified - master';

run_tests;
