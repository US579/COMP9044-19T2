#!/usr/bin/perl -w


foreach $file (glob "*.[ch]"){
    open F,"<",$file or die;
    @arr=<F>;
    $num=@arr;
    close F;
    $dic{$file}=$num;
}


foreach $k ( keys %dic){
    print "$dic{$k}";
    print " $k\n";
    printf "%7d %s\n", $dic{$k},$k;
}
