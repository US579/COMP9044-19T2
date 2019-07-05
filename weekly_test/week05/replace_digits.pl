#!/usr/bin/perl -w

$filename=$ARGV[0];
open F, "<", "$filename" or die "can not open!";
@lis=();
while (<F>){
    $_ =~ tr /[0-9]*/#/;
	push @lis, $_;
}
close F;

open F1, ">", "$filename" or die "can not open !";
foreach $i ( @lis ){
    print F1 $i;
}
close F1;


