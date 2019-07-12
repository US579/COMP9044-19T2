#!/usr/bin/perl -w

$cout = 0;
$arg = shift @ARGV;
$word = "";
while(<>){
	$dic{$_}++;
	$cout++;
	foreach $w (keys %dic ){
		if ( $dic{$w} == $arg ){
			$word = $w;
			chomp($word);
			print "Snap: $word\n";
			exit 0;
		}
	}

}

