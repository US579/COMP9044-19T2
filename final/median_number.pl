#!/bin/usr/perl -w

@arr=sort{$a<=>$b} @ARGV;

print @arr;

$len=@arr;


if ($len%2 == 1){
    print @arr[$len / 2 -0.5 ]
}
