#!/usr/bin/perl -w


sub reader{
    my ($f) =@_;
    open F,"<","$f" or die;
    @arr=<F>;
    close F;
    return join "",@arr;
}

sub comp{
    my ($f1,$f2)=@_;
    return 0 if ! -r $f1 or ! -r $f2;
    return reader($f1) eq reader($f2);
}



foreach $file (sort glob "@ARGV[0]/*"){
    $name = $file;
    $name =~ s/.*\///;
    $sec = "@ARGV[1]/$name";
    if ( comp($file,$sec)){
        print "$name\n";
    
    }


}
