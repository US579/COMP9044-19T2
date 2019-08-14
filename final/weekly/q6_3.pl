#!/usr/bin/perl -w


@arr=<>;

foreach $line (@arr){
    $line =~ s/\.[0-4]+[0-9]*//g;
    $tempp = $line;
    @update_nums = $line =~ /([0-9]+\.[5-9][0-9]*)/g;
    if (@update_nums){
    foreach $n (@update_nums){
        $temp = $n;
        $n =~ s/\..*//;
        $n++;
        $tempp =~ s/$temp/$n/;
        }
    print $tempp;
    next;
    }
    print $tempp;
}
