#!/usr/bin/perl -w


use File::Compare;
use File::Basename;


if (@ARGV != 2){
	print "usage : $0 <dir1> <dir2>";
	exit 1;
}

$dir1 = $ARGV[0];
$dir2 = $ARGV[1];

# print $dir1;
# print $dir2;

foreach $x (glob "$dir1/*"){
	$name = basename($x);
	if (compare($x,"$dir2/$name")==0){
		print "$name\n";
	}
}

# sort(@array);

# foreach $n (@array){
# 	print "$n\n";
# }