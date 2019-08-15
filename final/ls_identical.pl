#!/usr/bin/perl -w


$dir1=$ARGV[0];
$dir2=$ARGV[1];

foreach $name (glob "$dir1/*"){
    $name =~ s/.*\///;
    $file1="$dir1/$name";
    $file2="$dir2/$name";
    if ( iden($file1,$file2) ){
        print "$name\n";
    }
}


sub iden{
    my ($f1,$f2) = @_;
    return 0 if ! -r $f1  || ! -r $f2;
    return comp($f1) eq comp($f2);
}

sub comp{
    my ($f) =@_;
    open F ,"<",$f or die;
    @arr=<F>;
    close F;
    return join "", @arr;
}
