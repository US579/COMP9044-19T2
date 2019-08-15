#!/usr/bin/perl -w


die "Usage:$0 <digit> <digit> <file>" if @ARGV != 3;


open F ,">" ,"$ARGV[2]" or die;
for ($i = $ARGV[0]; $i <= $ARGV[1] ;$i++){
    print F "$i\n";
}
close F;
