#!/usr/bin/perl -w


sub fileReader{
    my ($file) = @_;
    open F ,"<" , $file or die;
    @arr = <F>;
    close F;
    return join "" , @arr;
}


for ($i = 0; $i <= @ARGV-2 ; $i++){
    if (fileReader($ARGV[$i]) ne fileReader($ARGV[$i+1])){
        print "$ARGV[$i+1] is not identical";
        exit 1;
    };


}

print "all same";
