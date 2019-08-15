#!/usr/bin/perl -w


open F, "<","$ARGV[0]" or die;
@arr=<F>;
close F;

$n = @arr;
if ($n == 0){
    exit 1;
}


$sum = 0;
foreach $l (@arr){
    if ($l =~ /\$/){
        $l =~ /([0-9]+\.[0-9]+)/;
        $sum += $1;
    }
}
printf "\$%.2f\n",$sum;
