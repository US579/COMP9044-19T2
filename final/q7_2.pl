#!/usr/bin/perl -w
#

@array =<>;

$num = 1;
foreach (@array){
    $dic{$num} = $_;
    $num++;
}

foreach $w (@array){
    if ( $w =~ /^#/){
        $w =~ s/#//;
        $w += 0;
        print $dic{$w};
    }else{
        print $w;
    }
}
