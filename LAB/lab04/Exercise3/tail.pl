#!/usr/bin/perl -w

if (@ARGV>0 && $ARGV[0] =~ /-\d+/){
   $ARGV[0] =~ s/-//;
   $num=$ARGV[0];
   shift @ARGV;
}else{
   $num=10;
}



if (@ARGV==0){
  @line=<>;
  while(@line>$num){
    shift @line;
  }
  foreach $l (@line){
    print $l;
  }
}

else{
  foreach $file (@ARGV){
    open my $fi, '<', $file or die "$0: can't open $file\n";
    if (@ARGV > 1){
        print "==> $file <==\n";
      }
      @line=<$fi>;
      while (@line>$num){
        shift @line;
      }
      foreach $l (@line){
        print $l;
      }
      close $fi;
    }
}


