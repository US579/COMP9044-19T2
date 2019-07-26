#!/usr/bin/perl -w


@array=();
foreach my $x (@ARGV) {
	push @array ,$x;
}


$size = @array;
$size = $size/2;
@array=sort(@array);
$size -= 0.5;
print "$array[$size]\n";
