#!/usr/bin/perl -w
while ($line = <>){
	@array = split / /, $line;
	foreach $n (@array){
		if ( $n =~ /(\-?\d*\.?\d+)/){
			# print $1;
			push @lis , $1
		}
	}
	if ($#lis == -1 ){
		next;
	}

	my $num = (sort {$b <=> $a} @lis)[0];
	# print $num;
	$dic{$line} = $num;
	push @compare , $num;
	@di = keys %dic;
	# print @compare;
	# foreach $v (@di){
	# 	print "$dic{$v} ==> $v";
	# }
	@lis = ();

}

my $mx = (sort {$b <=> $a} @compare)[0];
# print $mx;
@di = keys %dic;
foreach $w (@di){
	# print $w;
	if ( $dic{$w} eq $mx ){
		print $w;
	}
}
