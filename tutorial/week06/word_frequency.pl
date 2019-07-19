#!/usr/bin/perl -w


die "Usage: $0 <word>\n" if @ARGV != 1;
$word = shift @ARGV;
print $word;

while ($line = <> ){
	@arr = split /[^a-z]/i , $line;
}
foreach $w ( @arr){
	print $w;
}