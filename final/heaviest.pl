#!/usr/bin/perl -w


@arr = @ARGV;


foreach $n (@arr){
    $dic{$n}++;
}

@kk = keys %dic;
foreach $num (@kk){
    $nn = $num * $dic{$num};
    push @haha ,$nn;
    $dic2{$num} = $nn;
}
@larg = sort{$b<=>$a} @haha;
$la = $larg[0];
foreach $w (keys %dic2){
    if ($dic2{$w} == $la){
        print "$w\n";
    }

}


