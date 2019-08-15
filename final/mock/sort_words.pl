#!/usr/bin/perl -w


@arr=<>;

foreach $line (@arr){
    chomp $line;
    @lis = split /[ ]+/,$line;
    @lis = sort @lis;
    print "@lis\n";

}
