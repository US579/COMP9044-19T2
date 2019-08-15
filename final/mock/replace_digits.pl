#!/usr/bin/perl -w


open F,"<","$ARGV[0]" or die;
@arr=<F>;
close F;

open F,">","$ARGV[0]" or die;
foreach $line (@arr){
    $line =~ s/\d/#/g;
    print F $line;
}
close F;
