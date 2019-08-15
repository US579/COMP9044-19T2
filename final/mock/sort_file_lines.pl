#!/usr/bin/perl -w

open F,"<","$ARGV[0]" or die;
@arr=<F>;
close F;

foreach $line (@arr){
    $dic{$line} = length($line);
}

@k = keys %dic;
@k = sort{$dic{$a}<=>$dic{$b}} @k;

$flag = $dic{$k[0]};
foreach $line (@k){
    if ($dic{$line} == $flag){
        push @ary,$line;
    }else{
        foreach (sort @ary){
            print $_;
        }
        $flag = $dic{$line};
        @ary = ();
        push @ary,$line;
    }
}

print @ary;
