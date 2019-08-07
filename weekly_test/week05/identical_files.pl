#!/usr/bin/perl -w

use File::Compare;

if (@ARGV == 0){
    print "Usage: ./identical_files.pl <files>\n";
    exit 1;
}


@arg=();
foreach (@ARGV){
    push @arg ,$_;
}

foreach  $i (0..$#arg-1){
$issame=1;
foreach $f1 (@arg){
    foreach $f2 (@arg){
        if ( compare($f1,$f2) != 0){
            $issame = 0;
        }
    }
}
if ($issame == 1){
    print "All files are identical\n";
    exit 0;
}


if (compare($arg[$i],$arg[$i+1])!=0){
        print "$arg[$i+1] is not identical\n";
        exit 1;
    }
}