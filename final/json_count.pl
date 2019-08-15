#!/usr/bin/perl -w

$species=$ARGV[0];
$file=$ARGV[1];

open F,"<" ,$file or die;
@arr=<F>;
close F;

$sum = 0;
foreach $line (@arr){
    if ($line =~ /how_many/){
        @a = $line =~ /(\d+)/;
    }
    if ( $line =~ /$species/){
        $sum += $a[0];   
    }

}

print "$sum\n";
