#!/usr/bin/perl -w

@arr=@ARGV;


$word = shift @arr;
$dic{$word} = 1;

print "$word ";
foreach $w (@arr){
    if ( exists $dic{$w} ){
        next;
    }else{
        print "$w ";
        $dic{$w} = 1;
    }
}

print "\n";
