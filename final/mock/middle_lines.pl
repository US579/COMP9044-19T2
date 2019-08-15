#!/usr/bin/perl -w
#
#


    



open F,"<","$ARGV[0]" or die;
@arr=<F>;
close F;
$n = @arr;
if ($n == 0){
    exit 1;
}


$num=@arr;

if( $num % 2 == 1  ){
    print @arr[int($num/2)];
}else{
    print  "@arr[int($num/2)-1]";
    print  "@arr[int($num/2)]";

}
