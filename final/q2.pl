#!/usr/bin/perl 

while(<>){
    chomp;
    @a = split;
    print "$a[0] ";
    print "$a[1]\n";

    $h{$a[0]} .= $a[1];
}

print "$h{a}\n"
$kk{"b"} = 1;
$kk{"b"} = 2;
print $kk{"b"};
