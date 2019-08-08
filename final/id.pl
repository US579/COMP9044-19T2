#!/usr/bin/perl -w

sub reader{
    my ($file) = @_;
    open F,"<" ,$file or die;
    @arr = <F>;
    close F;
    return join "",@arr;
}


@array=@ARGV;
$l = shift @array;
$n = reader($l);


foreach $f (@array) {
    if ( reader($f) ne $n ){
        print "$f is not identical";
        exit 0;
    }
}

print "all file is identical";
