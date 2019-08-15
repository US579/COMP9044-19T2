#!/usr/bin/perl -w


open F ,"<" ,$ARGV[2] or die;
@arr=<F>;
close F;


foreach $line (@arr){
    chomp $line;
    @char = split //, $line;
    print @char[$ARGV[0]-1..$ARGV[1]-1];
}
