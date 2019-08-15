#!/usr/bin/perl -w

@arr=<>;

foreach $line (@arr){
    @number = $line =~ /\-?(?:\.[0-9]+ |[0-9]+\.?[0-9]*)/g;
    if (@number){
    @number = sort{$b<=>$a} @number;
    push @ha , $number[0];
    push @lines,$line;
    }
}

if (@ha){
    @last = @ha;
    @last = sort{$b<=>$a} @last;
    $index=0;
    foreach $n (@ha){
        if ( $n == $last[0] ){
            print $lines[$index];
     }
        $index++;
    }
}
