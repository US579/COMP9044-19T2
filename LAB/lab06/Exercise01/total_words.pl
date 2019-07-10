#!/usr/bin/perl -w

@count=();
while ($line=<>){
	@list = split /[^a-z]/i, $line;
	foreach $word (@list){
	push @count, $word if $word !~ /^$/;
	}
}
$len=@count;
print "$len words\n";

