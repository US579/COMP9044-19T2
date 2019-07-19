#!/usr/bin/perl -w
while ($line = <>){
	@array = split / /, $line;
	foreach $n (@array){
		if ( $n =~ /(\-?\d*\.?\d+)/){
			print $1;
			push @lis , $1
		}
	}
	if ($#lis == -1 ){
		exit 1;
	}
	
@lis=reverse sort(@lis);
$num = shift @lis;
print $num;
push @compare , $num;
@compare = reverse sort(@compare);
$mx = shift @compare;
print $mx;
}
