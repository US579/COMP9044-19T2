#!/usr/bin/perl -w

@arr =<>;

foreach $line (@arr){
    chomp $line;
    @lis = split /\s+/, $line;
    @lis = sort(@lis);
    print "@lis\n" ;
}
