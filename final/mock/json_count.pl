#!/usr/bin/perl -w


$name = $ARGV[0];
$json = $ARGV[1];


open F ,"<","$json" or die;
@arr=<F>;
close F;

$sum = 0;
foreach $line (@arr){
    if ($line =~ /species/){
        $line =~ /: "(.*)"/;
        if ( $1 eq  $name){
            $sum += $n;
        }
    }
    if ($line =~ /how_many/){
        $num = $line;
        $num =~ /([0-9]+)/;
        $n  =$1;
    }
}
print "$sum\n";
