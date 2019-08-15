#!/usr/bin/perl -w



#open F, "<","$ARGV[0]" or die;
@arr = <>;
#close F;

foreach $line (@arr){
    $line =~ s/\.[0-4][0-9]*//g;
    $temp = $line;
    @nums = $line =~ /([0-9]+\.[0-9]+)/g;
    if (@nums){
           foreach $w (@nums){
           $flag =$w;
           $w =~ s/\..*//;
           $w++;
           $temp =~ s/$flag/$w/;
       }
       print $temp;
       next;
    }
    print $temp;
}
