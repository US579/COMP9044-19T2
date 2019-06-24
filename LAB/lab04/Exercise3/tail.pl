#!/usr/bin/perl -w

if (@ARGV>0 && $ARGV[0] =~ /-\d+/){
   $ARGV[0] =~ s/-//;
   $num=$ARGV[0];
}else{
   $num=10;
}


shift @ARGV;
if (@ARGV==0){
   @line=<>;
   $count=@line-$num;
   print "$count\n";
   while(<>){
   if ($count<$num){
     $count++;
     next;
    }else
    {
      print;
    }

}
}else{
   foreach $file (@ARGV){

}


}



#foreach $file (@ARGV){
#   if ( ! -e $file ){
#      print "$0: can't open FileName"
#}else{
#   
#   print "$file\n";
#}
#}
