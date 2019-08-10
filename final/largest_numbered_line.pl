#!/usr/bin/perl -w

@arr=<>;



foreach $line  (@arr){
    @nums = $line =~ /\-?(?:\d+\.?\d*|\d*\.\d+)/g;
    #print @nums;
    if (@nums){
    @sort_nums = sort{$b<=>$a} @nums;
    $larg=$sort_nums[0];
    $dic{$line} = $larg;
    push @numarr ,$larg;
}
}

$bignum = (sort{$a<=>$b} @numarr)[0];

@val = values %dic;
foreach $w (keys %dic){
    if ($dic{$w} == $bignum){
        print $w;
    }
    
}
