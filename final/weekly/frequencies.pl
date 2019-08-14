#!/usr/bin/perl -w


@arr = <>;

foreach $line (@arr){
    chomp $line;
    $line =~ s/[^a-zA-Z0-9]//g;
    @arl = split //,$line;
    push @ar,@arl;
}
print "@ar\n";

foreach $word(@ar){
    if (! exists $dic{$word}){
        $dic{$word}= 1;
    }else{
        $dic{$word}++;
    }
}




foreach $k (sort keys %dic){
     print "$k occureed $dic{$k} times\n";

}
