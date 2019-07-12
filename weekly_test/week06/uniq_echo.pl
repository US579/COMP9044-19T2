#!/usr/bin/perl -w



@index = ();
foreach $arg ( @ARGV ){
	if ( exists $dic{$arg}){
		next;
	}
	$dic{$arg}=1;
	push @index , $arg;
}

foreach (@index){
		print "$_ ";
}
print "\n";
