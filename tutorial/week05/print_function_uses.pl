#!/usr/bin/perl -w


die "Usage : $0 <fname>" if (@ARGV != 1);

$fname = shift @ARGV;

foreach $file (glob "*.c"){
	
}