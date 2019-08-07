#!/usr/bin/perl -w

@array=<>;
#print @array;


foreach $w (@array){
    $w =~ s/\.[0-4][0-9]*//;
    $buff =$w;
    if ($buff =~ /([0-9]+\.[0-9]*)/){
        $buff =~ /([0-9]+\.[0-9]*)/;
        #print $buff;
        $num =  $1;
        $num =~ s/\..*//;
        $num +=1;
        $buff =~ s/([0-9]+[0-9]*\.[0-9]*)/$num/;
    }
        print $buff;
    #print $w;



}
