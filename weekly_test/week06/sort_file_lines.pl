#!/usr/bin/perl -w

$file = shift @ARGV;

open F , "<" ,"$file" or die "can not open!\n";
@line=<F>;
close F;

# the func to compare the length $a and $b is the 
# formal parameter that assign by the vlaue in the array

sub compare_len {
    return $len_dic{$a} <=> $len_dic{$b};
}

# store line and its length in the dic
foreach $ll (@line){
	$len_dic{$ll}=length($ll);
}

#sort it by the func def above 
@lis = sort compare_len @line;


# set a temporary array to store the line that has the same length
@kk = ();
# set the initial vlaue as smallest length in the file
$leng = length($lis[0]);
foreach $l (@lis){
	if ($len_dic{$l} == $leng){
		# if the len is the same , push it into the array
		push @kk,$l;
	}else{
		# once the length is different , means that change to the second smallest length, print 
		# out the first line 
		foreach (sort @kk){
			print "$_";
		}
		# clean up the array
		@kk = ();
		# set the length to the next
		$leng=length($l);
		push @kk, $l;
	}
}
print @kk;