#!/usr/bin/perl -w

#while ( <> ){
#    push @array , $_;
#}

@array = <STDIN>;


foreach  ( @array ){
    @array = split (/\s+/,$_);
    @array = sort(@array);
    print "@array\n";
    #    pop @array;
    #print join " ", @array;    
}
