#!/usr/bin/perl -w



@index = ();
foreach $arg ( @ARGV ){
	# if the value already exists in the dic continue
	if ( exists $dic{$arg}){
		next;
	}
	# only push the unique value to the array
	$dic{$arg}=1;
	push @index , $arg;
}

foreach (@index){
		print "$_ ";
}
print "\n";
