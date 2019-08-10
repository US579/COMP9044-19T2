#!/usr/bin/perl -w

@arr=sort{$a<=>$b} @ARGV;


$len=@arr;


if ($len%2 == 1){
    print "@arr[$len / 2 -0.5 ]\n"
}
