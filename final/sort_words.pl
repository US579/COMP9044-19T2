#!/usr/bin/perl -w

@array = <STDIN>;

foreach $w (@array){
    @arr=split (/\s+/,$w);
    @arr=sort (@arr);
    print "@arr\n";
}
