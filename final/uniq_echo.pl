#!/usr/bin/perl -w

@array=@ARGV;


$one = shift @array;

$dic{$one} = 1;
print "$one ";
foreach $w ( @array ){
    if (exists $dic{$w} ){
        next;
    }else{
        print "$w ";
        $dic{$w} =1;
    }
}
print "\n";
