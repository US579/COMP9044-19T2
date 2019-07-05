#!/usr/bin/perl -w

sub split{
@list=();
while ($w=<STDIN>){
    $w =~ s/(.*?)\s//;
    push @list ,$w;
}
push @list , $w if $w ne "";

@list=sort @list;

$concat="";
foreach $word (@list){
    $concat="$concat ".$word;

}
$concat =~ s/^ //;
print "$concat\n";
