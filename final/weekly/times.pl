#!/usr/bin/perl -w
die "Usage: $0 <n> <m> <>" if @ARGV != 3;


$width =$ARGV[2];
foreach $i (1..$ARGV[0]){
        printf "%${width}d",$i;
    foreach $j (1..$ARGV[1]){
        printf "%${width}d",$i*$j;
    }
    print "\n";
}
