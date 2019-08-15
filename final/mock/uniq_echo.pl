#!/usr/bin/perl -w

@arr=@ARGV;

$num=0;
foreach $word (@arr){
    if (exists $dic{$word}){
        next;
    }else{
       $dic{$word}=$num;
       $num++;
    }
}

@k = keys %dic;

@k = sort{$dic{$a}<=>$dic{$b}} @k;

foreach $w (@k){
    print "$w ";
}
print "\n";
