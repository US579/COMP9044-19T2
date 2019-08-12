#!/usr/bin/perl -w


@arr=<>;

foreach $line (@arr){
    $line =~ s/\.[0-4][0-9]*//g;
    $temp = $line;
    @nums = $line =~ /([0-9]+\.[5-9]+)/g;
    if (@nums){
        foreach $n (@nums){
            $tempp = $n;
            $n =~ s/\..*//;
            print "$n\n";
            $update_n = $n + 1;
            print $update_n;
            $temp =~ s/$tempp/$update_n/; 
        }
        print "$temp\n"
    }
}
