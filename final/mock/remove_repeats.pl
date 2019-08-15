#!/usr/bin/perl -w

foreach $w (@ARGV){
    if (exists $dic{$w}){
        next;
    }
    print "$w ";
    $dic{$w} = 1;
}

print "\n";
