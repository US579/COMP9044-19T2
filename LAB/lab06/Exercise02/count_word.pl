#!/usr/bin/perl -w


die "Usage: $0 <word>\n" if @ARGV != 1;
$word = shift @ARGV;

while ($line = <> ){
	@arr = split /[^a-z]/i , $line;
	foreach $w (@arr){
		$hash{lc $w}++;
	}
}

if (! exists $hash{$word}){
	print "$word occurred 0 times\n"

}else{
	print "$word occurred $hash{$word} times\n"
}