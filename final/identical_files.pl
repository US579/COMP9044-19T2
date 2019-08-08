#!/usr/bin/perl -w


sub readfile {
    my ($file) =@_;
    open F ,"<","$file" or die;
    @line = <F>;
    close F;
    return join "",@line;
}

@p=@ARGV;

$file1= shift @p;
$buff = readfile($file1);



foreach $f (@p){
    if ( readfile($f)  ne  $buff ){
        print "$f is not identical";
        exit 0;
    }
}

print "All file are identifical!";
