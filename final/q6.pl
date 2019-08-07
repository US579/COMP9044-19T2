#!/usr/bin/perl -w

@array=<>;
print @array;


foreach $w (@array){
    $w =~ tr/.[0-9]* /#/;
    print $w;



}
