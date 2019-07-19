#!/usr/bin/perl -w 

$file = $ARGV[0];
open F,"<",$file or die "can not open!";
@array=<F>;
close F;
$len = $#array+1;
if ($len % 2 == 0){
	$index = $len/2;
	print $array[$index-1];
	print $array[$index];
}else{
	
	$index = ($len-1)/2;
	print $array[$index];
}
