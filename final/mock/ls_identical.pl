#!/usr/bin/perl -w

sub reader{
    my ($file) = @_;
    open F,"<","$file" or die;
    @arr = <F>;
    close F;
    return join "",@arr;
}

sub comp{
    my ($f1,$f2) = @_;
    return 0 if ! -r $f1 or ! -r $f2;
    return reader($f1) eq reader($f2);
}


foreach $f (sort glob "$ARGV[0]/*"){    
    $name = $f;
    $name =~ s/.*\///;
    $second = "$ARGV[1]/$name";
    if (comp($f,$second)){
        print "$name\n" if -r $second;
    }
}
