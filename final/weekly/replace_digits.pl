#!/usr/bin/perl -w

die "Usage:$0 <file>" if @ARGV != 1;

open F ,"<",$ARGV[0] or die;
@arr = <F>;
close F;
foreach $line (@arr){
    $line =~ s/\d/#/g;
    push @ll ,$line;
    print "$line\n";
}

open F,">",$ARGV[0] or die;
foreach $word (@ll){
    print F  $word;
}
close F;

