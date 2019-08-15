#!/usr/bin/perl -w


while($line=<STDIN>){
    $dic{$line}++;
    @k = keys %dic;
    foreach $w (@k){
        if ($dic{$w} == $ARGV[0]){
            print "Snap: $w";
            exit 1;
        }
    }
}
