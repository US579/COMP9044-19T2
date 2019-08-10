#!/usr/bin/perl -w

$dir1=$ARGV[0];
$dir2=$ARGV[1];

foreach $x (glob "$dir1/*"){
    $basename =~ s/.*\///;
    $file2="$dir2/$basename";
    $file1="$dir1/$basename";
    if (iden($file1,$file2)){
        print $x;
    }
}


sub iden{
    my ($f1,$f2) = @_;
    return 0  if ! -r $f1 || ! -r $f2 ;
    return comp($f1,$f2);
}

sub comp{
    my ($f1,$f2) = @_;
    open F ,"<" ,$f1 or die;
    @arr=<F>;
    close F;

    open F ,"<" ,$f2  or die;
    @arr1=<F>;
    close F;
    return join "",@arr eq join "" ,@arr1;
}
