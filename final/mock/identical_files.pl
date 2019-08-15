#!/usr/bin/perl -w

die "Usage:$0 <files>" if @ARGV == 0;



sub filereader{
    my ($file) =@_;
    open F,"<","$file" or die;
    @arr=<F>;
    close F;
    return join "",@arr;
}


sub comp{
    my ($f1,$f2) =@_;
    return filereader($f1) ne filereader($f2);
}

$num =@ARGV;
for($i = 0 ; $i <$num-1;$i++){
    if (comp($ARGV[$i],$ARGV[$i+1])){
         print "$ARGV[$i+1] is not identical\n";
        exit 1;   
     }
    
}
print "All files are identical\n";
