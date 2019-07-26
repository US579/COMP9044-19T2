#!/usr/bin/perl -w


@array=();
foreach my $x (@ARGV) {
	push @array ,$x;
}

sub comp(){
	return $array{$a} <=> $array{$b};
}

$size = @array;
$size = $size/2;
@array = sort {$a <=> $b} @array;


$size = $size - 0.5;
print "$array[$size]\n";