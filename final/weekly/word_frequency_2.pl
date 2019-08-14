#!/usr/bin/perl -w


@arr=<>;


foreach $line (@arr){
    $line =~ tr/[A-Z]/[a-z]/;
    $line =~ s/[^a-z ]/ /g;
    @sp = split / /,$line;
    
    push @all , @sp;
}

foreach $word (@all){
    if (! exists $dic{$word}){
        $dic{$word} = 1;
    }else{
        $dic{$word}++;
    }
}

@haha =keys %dic;

@haha = sort{$dic{$a} <=> $dic{$b}} @haha;

foreach $w (@haha){
    print "$dic{$w} $w\n";
}
