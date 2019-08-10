#!/usr/bin/perl -w
#

@arr=@ARGV;



sub three{
    my ($word) = @_;    
    @lis = split "",$word;
    $count = 0;
    foreach (@lis){
        if ( $_ eq "0" ){
            $count++;
            if ( $count == 3){
                return 1;
            }
        }else{
            $count=0
        }
    }
    return 0;
}


foreach $w (@arr){
    $wd=$w;
    $w =~ tr /[AEIOU]/0/;
    $w  =~ tr /[aeiou]/0/;
    if ( three($w) ){
        print "$wd ";
    } 
}

print "\n";
