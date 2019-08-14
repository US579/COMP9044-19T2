#!/usr/bin/perl -w

@arr=<>;

foreach $line (@arr){
    $line =~ tr/A-Z/a-z/;
    foreach $word ($line =~ /[a-z]+/g){
        push @array,$word; 
    }
}




foreach $word (@array){
    if (! exists $dic{$word}){
        $dic{$word} = 1;
    }else{
        $dic{$word}++;
    }
}

@keyss = keys %dic;
@sort_array = sort{$dic{$a}<=>$dic{$b}} @keyss;


foreach $k (@sort_array){
        print "$dic{$k} ";
        print "$k\n";
}
