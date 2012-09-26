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

    my $cached_d = dir(tempdir(CLEANUP => 1));

    my $action = AnyEvent::Git::Repository->new_from_url_and_cached_repo_set_d($temp_d->stringify, $cached_d);
    $action->get_branches_as_cv->cb(sub {
        my $branches = $_[0]->recv;
        test {
            eq_or_diff $branches, [[$rev, 'master']];
            done $c;
            undef $c;
        } $c;
    });
} n => 1;

test {
    my $c = shift;

    my $temp_d = dir(tempdir(CLEANUP => 1));
    system "cd $temp_d && git init && echo 'hoge:\n\techo 1234 > foo.txt' > Makefile && git add Makefile && git commit -m New";
    my $rev = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev;

    system "cd $temp_d && git checkout -b abc/def && touch aaa && git add aaa && git commit -m aaa";
    my $rev2 = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev2;

    my $cached_d = dir(tempdir(CLEANUP => 1));

    my $action = AnyEvent::Git::Repository->new_from_url_and_cached_repo_set_d($temp_d->stringify, $cached_d);
    $action->get_branches_as_cv->cb(sub {
        my $branches = $_[0]->recv;
        test {
            eq_or_diff $branches, [[$rev2, 'abc/def'], [$rev, 'master']];
            done $c;
            undef $c;
        } $c;
    });
} n => 1;

test {
    my $c = shift;

    my $temp_d = dir(tempdir(CLEANUP => 1));
    system "cd $temp_d && git init && echo 'hoge:\n\techo 1234 > foo.txt' > Makefile && git add Makefile && git commit -m New";
    my $rev = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev;

    my $cached_d = dir(tempdir(CLEANUP => 1));

    my $action = AnyEvent::Git::Repository->new_from_url_and_cached_repo_set_d($temp_d->stringify, $cached_d);
    $action->get_tags_as_cv->cb(sub {
        my $branches = $_[0]->recv;
        test {
            eq_or_diff $branches, [];
            done $c;
            undef $c;
        } $c;
    });
} n => 1, name => "n otags";

test {
    my $c = shift;

    my $temp_d = dir(tempdir(CLEANUP => 1));
    system "cd $temp_d && git init && echo 'hoge:\n\techo 1234 > foo.txt' > Makefile && git add Makefile && git commit -m New";
    my $rev = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev;

    system "cd $temp_d && touch aaa && git add aaa && git commit -m aaa && git tag abc/de";
    my $rev2 = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev2;

    my $cached_d = dir(tempdir(CLEANUP => 1));

    my $action = AnyEvent::Git::Repository->new_from_url_and_cached_repo_set_d($temp_d->stringify, $cached_d);
    $action->get_tags_as_cv->cb(sub {
        my $branches = $_[0]->recv;
        test {
            eq_or_diff $branches, [[$rev2, 'abc/de']];
            done $c;
            undef $c;
        } $c;
    });
} n => 1, name => 'has tag';

test {
    my $c = shift;

    my $temp_d = dir(tempdir(CLEANUP => 1));
    system "cd $temp_d && git init && echo 'hoge:\n\techo 1234 > foo.txt' > Makefile && git add Makefile && git commit -m New";
    my $rev = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev;

    system "cd $temp_d && touch aaa && git add aaa && git commit -m aaa && git tag abc/de";
    my $rev2 = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev2;

    my $cached_d = dir(tempdir(CLEANUP => 1));

    my $action = AnyEvent::Git::Repository->new_from_url_and_cached_repo_set_d($temp_d->stringify, $cached_d);
    $action->get_commit_info_as_cv($rev)->cb(sub {
        my $parsed = $_[0]->recv;
        test {
            ok $parsed->{author}->{name};
            ok $parsed->{author}->{mail};
            is $parsed->{body}, 'New';
            is $parsed->{commit}, $rev;
            ok $parsed->{committer}->{name};
            ok $parsed->{committer}->{time};
            ok $parsed->{files}->{Makefile};
            ok $parsed->{tree};
            done $c;
            undef $c;
        } $c;
    });
} n => 8, name => 'commit info';

test {
    my $c = shift;

    my $temp_d = dir(tempdir(CLEANUP => 1));
    system "cd $temp_d && git init && echo 'hoge:\n\techo 1234 > foo.txt' > Makefile && git add Makefile && git commit -m New";
    my $rev = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev;

    system "cd $temp_d && touch aaa && git add aaa && git commit -m aaa && git tag abc/de";
    my $rev2 = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev2;

    my $cached_d = dir(tempdir(CLEANUP => 1));

    my $action = AnyEvent::Git::Repository->new_from_url_and_cached_repo_set_d($temp_d->stringify, $cached_d);
    $action->get_commit_info_as_cv(rand)->cb(sub {
        my $parsed = $_[0]->recv;
        test {
            is $parsed, undef;
            done $c;
            undef $c;
        } $c;
    });
} n => 1, name => 'commit info - commit not found';

test {
    my $c = shift;

    my $temp_d = dir(tempdir(CLEANUP => 1));
    system "cd $temp_d && git init && echo 'hoge:\n\techo 1234 > foo.txt' > Makefile && git add Makefile && git commit -m New";
    my $rev = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev;

    system "cd $temp_d && touch aaa && git add aaa && git commit -m aaa && git tag abc/de";
    my $rev2 = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev2;

    my $cached_d = dir(tempdir(CLEANUP => 1));

    my $action = AnyEvent::Git::Repository->new_from_url_and_cached_repo_set_d($temp_d->stringify, $cached_d);
    $action->get_commit_info_list_as_cv($rev2)->cb(sub {
        my $parsed = $_[0]->recv;
        test {
            ok scalar @$parsed, 2;
            ok $parsed->[0]->{author}->{name};
            ok $parsed->[0]->{author}->{mail};
            is $parsed->[0]->{body}, 'aaa';
            is $parsed->[0]->{commit}, $rev2;
            ok $parsed->[0]->{committer}->{name};
            ok $parsed->[0]->{committer}->{time};
            ok $parsed->[0]->{files}->{aaa};
            ok !$parsed->[0]->{files}->{Makefile};
            ok $parsed->[0]->{tree};
            is $parsed->[0]->{parent}->[0], $rev;
            ok $parsed->[1]->{author}->{name};
            ok $parsed->[1]->{author}->{mail};
            is $parsed->[1]->{body}, 'New';
            is $parsed->[1]->{commit}, $rev;
            ok $parsed->[1]->{committer}->{name};
            ok $parsed->[1]->{committer}->{time};
            ok $parsed->[1]->{files}->{Makefile};
            ok !$parsed->[1]->{files}->{aaa};
            ok $parsed->[1]->{tree};
            done $c;
            undef $c;
        } $c;
    });
} n => 20, name => 'commit info list';

test {
    my $c = shift;

    my $temp_d = dir(tempdir(CLEANUP => 1));
    system "cd $temp_d && git init && echo 'hoge:\n\techo 1234 > foo.txt' > Makefile && git add Makefile && git commit -m New";
    my $rev = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev;

    system "cd $temp_d && touch aaa && git add aaa && git commit -m aaa && git tag abc/de";
    my $rev2 = `cd $temp_d && git rev-parse HEAD`;
    chomp $rev2;

    my $cached_d = dir(tempdir(CLEANUP => 1));

    my $action = AnyEvent::Git::Repository->new_from_url_and_cached_repo_set_d($temp_d->stringify, $cached_d);
    $action->get_commit_info_list_as_cv(rand)->cb(sub {
        my $parsed = $_[0]->recv;
        test {
            eq_or_diff $parsed, undef;
            done $c;
            undef $c;
        } $c;
    });
} n => 1, name => 'commit info list - commit not found';

run_tests;
