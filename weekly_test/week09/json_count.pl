#!/usr/bin/perl -w

$File = $ARGV[1];
$match= $ARGV[0];

open F,"<","$File" or die;
$num = 0;
while (<F>){
	if ($_ =~ /"how_many"/){
		$_ =~ s/\"how_many\"\://;
		$_ =~ s/\,$//;
		$count = $_;
	}
	if ($_ =~ /"$match"/){
		$num += $count;
	}
}
print "$num\n";