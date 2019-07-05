#!/usr/bin/perl -w

$filename=$ARGV[0];

open F, "<", "$filename" or die "can not open!";
# foreach $line ( F ){
# 	print "$line\n";
# }

while (<F>){
    $_ =~ tr /[0-9]*/#/;
	print $_;
}
close F;
