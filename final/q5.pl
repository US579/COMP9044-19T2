#!/usr/bin/perl -w 

@array=@ARGV;
#print @array;
$one = shift @array;
#print $one;
$var{$one} = 1;

@arr = keys %var;
#print @arr;

print "$arr[0] ";
foreach $word ( @ARGV ){
        if ( exists $var{$word} ){
#            print "$word\n";
            next;
        }else{
            $var{$word} = 1;
           print "$word "
        }
}
print "\n";

