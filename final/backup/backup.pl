#!/usr/bin/perl -w


$name=$ARGV[0];


open F ,"<" ,"$name" or die;
@arr = <F>;
close F;

sub create{
    my  ($name, @arr) = @_;
    open F,">","$name" or die;
    foreach (@arr){
    print F $_;
    }
    close F;
}


if (! -e ".$name.0" ){
    create(".$name.0",@arr);
}else{
    $num=0;
    while ( -e ".$name.$num"){
        $num++;
        print "$num\n";
    }
    create(".$name.$num",@arr);
}
