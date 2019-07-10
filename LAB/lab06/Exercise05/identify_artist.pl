#!/usr/bin/perl -w




if ($ARGV[0] eq '-d'){
    shift(@ARGV);
    $flag = 1;
}
else{
    $flag= 0;
}


$dir = shift @ARGV;
$dir =~ s/0/\*/g;

foreach $f (glob "$dir"){
	open F , "<","$f" or die "can not open";
    @L=<F>;
    close F;
    %buff = ();
    foreach $line (@L){
		@arr1 = split /\W+/i , $line;
		foreach $ww ( @arr1 ){
			%has=&log_prob($ww);
			foreach $k (keys %has){
    			$buff{$k} += $has{$k};
				}
			}
		}
        if ($flag == 1){
            foreach my $x (reverse sort{$buff{$a} <=> $buff{$b}} keys %buff) {
                printf "$f: log_probability of %.1f for $x\n",$buff{$x};
            }
        }
        foreach my $x (reverse sort{$buff{$a} <=> $buff{$b}} keys %buff) {
                printf "$f most resembles the work of $x (log-probability=%.1f)\n",$buff{$x};
                last;
            }
    }




sub log_prob{
	my ($word) = @_;
	foreach $file (glob "lyrics/*.txt") {
	    open F1 , "<" ,"$file" or die "file can not open!\n";
        my @content = <F1>;
        close F1;
        $word_times = 0;
        $all_len = 0;

		foreach $line (@content){
            $linecp = $line;
            $wc = ($line =~ s/\b$word\b//ig );
            $tc = ($linecp =~ s/\W?[a-z]+\W?//ig);
            $word_times += $wc;
            $all_len += $tc;
        }
		$var=log(($word_times+1)/$all_len); 
		$file =~ s/\.txt//;
		$file =~ s/.*\///;
	    $file =~ s/_/ /g;
	    $dic{$file}=$var;
	    close F1;
	}
	return %dic;
}





