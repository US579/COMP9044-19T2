#!/usr/bin/perl -w


@arr=@ARGV;


$num=@arr;

$n=int($num/2);
@arr = sort{$a<=>$b} @arr;

print "$arr[$n]\n";
