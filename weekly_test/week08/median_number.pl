#!/usr/bin/perl
use Math::Round;
@array=();
foreach my $x (@ARGV) {
	push @array ,$x;
}

$size = @array.length();
$size = $size/2;
@array=sort(@array);
$size -= 0.5;
print "@array[$size]\n";
