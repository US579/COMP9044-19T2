#!/usr/bin/perl -w


@arr=<>;
foreach $line (@arr){
    $line =~ s/[aeiou]//ig;
    print $line;
}


