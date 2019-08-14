#!/usr/bin/perl -w


die "Usage:$0 <file1> <file2>" if @ARGV != 2;

$file1=$ARGV[0];
$file2=$ARGV[1];

$x = 'x';
for ($i = 1; $i <= 3; $i++) {
    $x = "($x)";
}
print "$x\n";
open F ,"<",$file1 or die ;
@arr1 = <F>;
close F;

open F ,"<",$file2 or die ;
@arr2 = <F>;
close F;

foreach $w1 (@arr1){
    $flag=0;
    foreach $w2 (@arr2){
        if ( $w1 eq $w2){
            $flag =1;
        }else{
            next;
        }
    }
    if ($flag == 0){
        push @different, $w1;
    }
}

print "@different\n";




