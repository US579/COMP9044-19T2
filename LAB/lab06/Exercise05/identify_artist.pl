#!/usr/bin/perl -w

if ($ARGV[0] eq '-d'){
    shift(@ARGV);
    $flag = 1;
}
else{
    $flag= 0;
}




foreach $file (glob "lyrics/*.txt") {
    open F1 , "<" ,"$file" or die "file can not open!\n";
    my @content = <F1>;
    close F1;
    $file =~ s/\.txt//;
    $file =~ s/.*\///;
    $file =~ s/_/ /g;
    foreach $line (@content){
        $line =~ tr /A-Z/a-z/;
        @words = split /[^a-z]+/,$line;
        $tcount = ($line =~ s/\W?[a-z]+\W?//ig);
        $word_total{$file}+=$tcount;
        foreach $word (@words){
            $word_times{$file}{$word}++;
        }
        }
    }   


@name = keys %word_total;
foreach my $f (@ARGV){
	open F , "<","$f" or die "can not open";
    @L=<F>;
    close F;
    %buff = ();
    foreach $line (@L){
        $line =~ tr/A-Z/a-z/;
		@arr1 = split /[^a-z]+/, $line;
		foreach $ww ( @arr1 ){
            foreach $n (@name){
                $buff{$n}+=log((($word_times{$n}{$ww}||0)+1)/$word_total{$n});
                }
			}
		}
        if ($flag == 1){
            foreach  $x (reverse sort{$buff{$a} <=> $buff{$b}} keys %buff) {
                printf "$f: log_probability of %.1f for $x\n",$buff{$x};
            }
        }
        foreach  $x (reverse sort{$buff{$a} <=> $buff{$b}} keys %buff) {
                printf "$f most resembles the work of $x (log-probability=%.1f)\n",$buff{$x};
                last;
            }
    }







