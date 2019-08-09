#!/usr/bin/perl -w


open F ,"<",$ARGV[0] or die;
@arr=<F>;
close F;

if (@arr ==2){
    print "\$0\.00\n";
    exit;
}


$sum= 0;
foreach $line (@arr){
    if ( $line =~ /\$/){
        $line =~ /\$(\d+\.\d+)/;
        $sum += $1;
    }
}

print "\$";
print "$sum\n"
