#!/usr/bin/perl -w

open F, "<" , $ARGV[0] or die;
@arr=<F>;
close F;


$mid = @arr;
if ($mid == 0){
    exit;
}

if ($mid%2 == 1){
    print @arr[$mid/2 -0.5];
}else{
    print @arr[$mid/2 -1];
    print @arr[$mid/2];
}
