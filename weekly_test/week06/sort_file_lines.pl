#!/usr/bin/perl -w

$file = shift @ARGV;

open F , "<" ,"$file" or die "can not open!\n";
@line=<F>;
close F;



sub compare_len {
    return $len_dic{$a} <=> $len_dic{$b};
}


foreach $ll (@line){
	$len_dic{$ll}=length($ll);
}




@lis = sort compare_len @line;

foreach (@lis){
	print "$_";
}