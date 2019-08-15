#!/usr/bin/perl -w


$function = shift @ARGV or die ;


foreach $file (glob "*"){
    open F,"<" ,"$file" or die ;
    while ($line = <F>){
        $line =~ s/\/\/.*//;

        $line =~ s /\/\* .*?\*\//;
        $line =~ /\b$function\s*\(/ or next;
        if ($line =~ /^\s/){
            print "used\n"
        }elsif( $line =~ /:/){
            print "declared\n";
        }else{
            print "defined\n";
        }
        }
    close F;
    }
