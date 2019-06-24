#!/usr/bin/perl -w


if (@ARGV>0 && $ARGV[0] =~ /-[0-9]+/ ){
    $ARGV[0] =~ s/-//;
    $num=$ARGV[0];
    shift @ARGV;
}else{
    $num=10;
}

if (@ARGV==0){
    @line=<>;
    while (@line>$num){
        shift @line;
    }
    foreach $l (@line){
        print $l;
    }
}
else{
    foreach $l (@ARGV){
        open my $f,"<",$l or die "can't not open $l/n";
        @line=<$f>;
        if (@ARGV>1){
            print "==> $l <==";
        }
        while (@line > $num){
            shift @line;
        }
        foreach $ff (@line){
            print "$ff";
        }
        close $f;
    }
}
