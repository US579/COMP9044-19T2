#!/usr/bin/perl -w

foreach my $x (@ARGV) {
	$org = $x;
	$x =~ tr /[aeiou]/0/;
	$x =~ tr /[AEIOU]/0/;
	foreach my $w ($x){
		my @lis= split //, $w;
		$cout = 0;
		foreach $c (@lis){
			if ( $c eq 0){
				$cout++;
				if ($cout eq 3){
					print "$org ";
					last;
				}

			}else{
				$cout = 0;
			}
		}
	}
}
print "\n";

