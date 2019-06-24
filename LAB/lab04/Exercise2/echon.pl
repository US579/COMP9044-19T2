#!/usr/bin/perl -w

if ( @ARGV != 2 ) {
  die "Usage: ./echon.pl <number of lines> <string>\n";
}

if ( $ARGV[0] !~ /^[0-9]+$/){
  die  "$0: argument 1 must be a non-negative integer\n";
}

for (my $i=0;$i<$ARGV[0];$i++){
   print "$ARGV[1]\n";
}
