#!/usr/bin/perl -w




foreach $arg ( @ARGV ){
	$dic{$arg}=1; 
}

@uniq = keys %dic;
foreach (@uniq){
	print "$_ ";
}
print "\n";

