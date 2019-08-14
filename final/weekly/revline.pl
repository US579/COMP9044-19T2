#!/usr/bin/perl -w
#


@arr=<>;

foreach $line (@arr){
    chomp $line;
    @a = split / /, $line;
    for ($i = $#a ;$i>= 0;$i--){
        print "$a[$i] ";
    }
    print "\n";
}
