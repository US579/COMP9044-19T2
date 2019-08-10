#!/usr/bin/perl -w

$dir1=$ARGV[0];
$dir2=$ARGV[1];

foreach $x (glob "$dir1/*"){
   $x =~ s/.*\///;
    print $x;
}
