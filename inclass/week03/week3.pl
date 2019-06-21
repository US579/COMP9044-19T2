#!/usr/bin/perl -w

$p=@ARGV;
print $p,"\n";
print @ARGV,"\n";

print "@ARGV\n";

print "bad example"
#bad example
for ($i=0;$i<=@ARGV;$i++){
    print "$ARGV[$i] ";
}
print "\n";
print "good example";
#good example
foreach $arg (@ARGV){
    print "$arg";
}
print "\n";

#contains the index
for $i (0..$#ARGV){
    print "$ARGV[$i]";
}

foreach $argv (@ARGV){
    $argv="andrew";
}
print "\n$argv\n";
