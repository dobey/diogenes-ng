#!/usr/bin/perl -w
use strict;
use Diogenes::UnicodeInput;

my $c = new Diogenes::UnicodeInput;

if (open my $in, "<:utf8", "tmp.in") {
    open my $out, ">:utf8", "tmp.out";
    while (<$in>) {
        s/(\p{Diogenes::UnicodeInput::IsMyGreekCopt})/join '', $c->decompose($1,'')/ge;
        print $out "$_";
    }
    close $in;
    close $out;
}
