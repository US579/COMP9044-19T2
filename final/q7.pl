#!/usr/bin/perl -w

@array = <>;
#print @array;
$num=1;
foreach $line (@array){
    $dic{$num} = $line;
    $num++;
    #print $num;
}
@ll = keys %dic;
foreach (@ll){
    #print "$_\n";
    #print $dic{$_};
}
foreach $w (@array){
    if ($w =~ /^#/){
     $w =~ s/#//;
     $num = $w;
     $num += 0;
     print $dic{$num};
    }else{
    print  $w;
}
}
