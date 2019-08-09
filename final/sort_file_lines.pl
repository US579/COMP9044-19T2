#!/usr/bin/perl -w

open F,"<",$ARGV[0] or die;
@array=<F>;
close F;


foreach my $w (@array){
    $dic{$w}=length($w);
}

sub comp{
    return $dic{$a} <=> $dic{$b};
}


@l = sort comp @array;


$firstlen=length($array[0]);

foreach $line (@l){
    if (length($line) == $firstlen){
        push @arr , $line;
    }else{

        foreach $len (sort(@arr)){
            print $len;
        }
        @arr =();
        $firstlen = length($line);
        push @arr ,$line;
    }
}
print @arr;
