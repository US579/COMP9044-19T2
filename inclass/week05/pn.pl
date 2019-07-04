#!/usr/bin/perl -w


while ($line =<>){
    $line =~ /(\d+)/;
    print "$1\n";
}
