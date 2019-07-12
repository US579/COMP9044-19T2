#!/usr/bin/perl -w

$file = shift @ARGV;

open F , "<" ,"$file" or die "can not open!\n";
@line=<F>;
close F;

sub compare_len {
    return $len_dic{$a} <=> $len_dic{$b};
}

foreach $ll (@line){
	$len_dic{$ll}=length($ll);
}


@lis = sort compare_len @line;


@kk = ();
$leng = length($lis[0]);
foreach $l (@lis){
	if ($len_dic{$l} == $leng){
		push @kk,$l;
	}else{
		foreach (sort @kk){
			print "$_";
		}
		@kk = ();
		$leng=length($l);
		push @kk, $l;
	}
}
print @kk;