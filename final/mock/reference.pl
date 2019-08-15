#!/usr/bin/perl -w

@arr = <>;


$num = 1;
foreach $w (@arr){
    $dic{$num} = $w;
    $num++;
}

foreach $l (@arr){
    if ($l =~ /^#/) {
        $l =~ s/#//;
        $l+=0;
        print $dic{$l};
        next;
    }
    print $l;


}


