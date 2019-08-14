#!/usr/bin/perl -w



@arr=<>;

foreach $line (@arr){
    $line =~ s/\.[0-4]+[0-9]*//g;
    $temppp = $line;
    @round_nums = $line =~ /([0-9]+\.[5-9]+[0-9]*)/g;
    if ( @round_nums ){
    foreach $n (@round_nums){
        $temp = $n;
        $n =~ s/\.[0-9]+//;
        $n++;
        $temppp =~ s/$temp/$n/;
    }
        print $temppp;
        next;
    }
    print $line;
}

