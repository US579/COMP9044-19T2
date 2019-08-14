#!/usr/bin/perl -w


foreach $line (<>){
    $line =~ s/[aeiou]//g;
    print $line;

}
