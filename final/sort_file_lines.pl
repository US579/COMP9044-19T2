#!/usr/bin/perl -w

open F,"<",$ARGV[0] or die ;
@arr=<F>;
close F;




sub comp{
    return $dict{$a} <=> $dict{$b};
}


foreach $line (@arr){
    $dict{$line} =length($line);
}

@ll = sort comp @arr;


$firstlen=length($ll[0]);
foreach $line (@ll){
    if (length($line) ==$firstlen){
        push @ar , $line;
    }else{
        foreach $i (sort(@ar)){
            print "$i";
        }
        @ar =();
        $firstlen = length($line);
        push @ar,$line;
    }
}
print @ar;
