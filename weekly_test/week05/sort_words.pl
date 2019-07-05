#!/usr/bin/perl -w

sub split{
	my ($w) = @_;
	@list=();
	while ($w){
		$w =~ s/(.*?)\s//;
		push @list , $1;
	}
	push @list , $w if $w ne "";
	@list=sort @list;
	$concat="";

	foreach $word (@list){
	    $concat="$concat ".$word;

	}
	$concat =~ s/^ //;
	return $concat;
}

@list=();
while ($x=<STDIN>){
	$line=&split($x);
	print "$line\n";
}
