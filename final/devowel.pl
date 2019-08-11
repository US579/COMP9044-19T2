#!/usr/bin/perl -w

@arr=<>;

foreach (@arr){
    $_ =~ s/[aeiou]//ig;
    print "$_\n";
}
