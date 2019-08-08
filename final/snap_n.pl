#!/usr/bin/perl -w


$num = $ARGV[0];
@arr=<STDIN>;


foreach $word (@arr){
    chomp $word;
    $dic{$word} = 0;
}

foreach $word (@arr){
    $dic{$word}+=1;
}

@kk = keys %dic;

foreach $k (@kk){
    if ( $dic{$k} == $num){
        print $k;
    }
}
