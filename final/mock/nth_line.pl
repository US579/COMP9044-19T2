#!/usr/bin/perl -w

open F,"<","$ARGV[1]" or die;
@arr=<F>;
close F;
$num=@arr;
if ($num < $ARGV[0] ){
    exit 1;
} 

print @arr[$ARGV[0]-1];
