use strict;
use warnings;
use Path::Class;
use lib glob file(__FILE__)->dir->parent->subdir('t_deps', 'modules', '*', 'lib')->stringify;
use Test::X1;
use Test::More;
use Test::Git::EditRepository;

test {
    my $c = shift;

    my $d = create_git_repository;
    ok -d $d;
    isa_ok $d, 'Path::Class::Dir';

    ok -d "$d/.git";
    ok -f "$d/.git/config";

    my $rev = get_git_revision $d;
    is $rev, undef;

    done $c;
} n => 5, name => 'create_git_repository';

test {
    my $c = shift;

    my $d = create_git_repository;

    create_git_files($d);

    {
        create_git_files(
            $d, 
            {name => 'abc', data => qq{\xFE\x80\xEF}},
        );

        my $data = $d->file('abc')->slurp;
        is $data, "\xFE\x80\xEF";
        ok !utf8::is_utf8($data);
        
        ok 0 == (system "cd \Q$d\E && git status | grep abc > /dev/null");
    }

    {
        create_git_files(
            $d, 
            {name => 'abcd/ef.txt', data => qq{\x{4e00}\x{5000}}},
        );

        my $data = $d->file('abcd', 'ef.txt')->slurp;
        is $data, "\xe4\xb8\x80\xe5\x80\x80";
        ok !utf8::is_utf8($data);
        
        ok 0 == (system "cd \Q$d\E && git status | grep abcd/ef.txt > /dev/null");
    }

    ok git_commit $d;
    ok !git_commit $d;

    ok 0 != (system "cd \Q$d\E && git status | grep abcd/ef.txt > /dev/null");
    ok get_git_revision $d;

    done $c;
} n => 10, name => 'create_git_files, git_commit';

test {
    my $c = shift;

    my $d = create_git_repository;

    create_git_files($d, {name => 'hoge'});
    git_commit $d;

    my $rev1 = get_git_revision $d;
    ok $rev1;
    ok $rev1 !~ /\n/;

    create_git_files($d, {name => 'fuga'});
    git_commit $d;

    my $rev2 = get_git_revision $d;
    ok $rev2;
    ok $rev2 !~ /\n/;
    isnt $rev2, $rev1;

    done $c;
} n => 5, name => 'get_git_revision';

test {
    my $c = shift;

    my $d = create_git_repository;
    
    create_git_files($d, {name => 'hoge'});
    git_commit $d;
    my $rev1 = get_git_revision $d;

    create_git_files($d, {name => 'fuga'});
    git_commit $d;
    my $rev2 = get_git_revision $d;

    git_checkout $d, $rev1;
    ok -f "$d/hoge";
    ok !-f "$d/fuga";
    my $rev3 = get_git_revision $d;
    is $rev3, $rev1;

    done $c;
} name => 'git_checkout', n => 3;

run_tests;
