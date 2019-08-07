#!/usr/bin/perl  -w
#

@array = <>;

foreach $line (@array){
   $line =~ s/(\.[0-4][0-9]*)//g;
   #   print $line;
   if ( $line =~ /([0-9]+\.[0-9]*)/){
       $buff = $line; 
       $line =~ /([0-9]+\.[0-9]*)/;
       $num = $1;
       $num =~ s/\.[0-9]*//;
       $num += 1;
       $buff =~ s/([0-9]+\.[0-9]*)/$num/;
        print $buff;
   }else{
    
        print $line;
   };
   print "\n";

}
