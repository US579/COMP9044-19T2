#!/usr/bin/perl -w


use File::Copy;


sub lastseq{
	@arry=();
	foreach $i (glob ".*"){
		$i =~ s/.*\.//;
		push @arry, $i;
	}
	$seq=(reverse sort @arry)[0];
	$seq+=1;
	return $seq;
}


if (@ARGV==1 && $ARGV[0] eq 'save'){
	if ( ! -d ".snapshot.0" ){
		mkdir( ".snapshot.0"  ) or die "cannot create '.snapshot.0' !";
		foreach $f1 (glob "*"){
			if ($f1 !~ ".*\.pl"){
		copy("$f1",".snapshot.0");
		}
		}	
		print "Creating snapshot 0\n";
	}else
	{
		$num=&lastseq();
		mkdir( ".snapshot.$num"  ) or die "cannot create '.snapshot.$num' !";
		foreach $f2 (glob "*"){
			if ($f2 !~ ".*\.pl"){
		copy("$f2",".snapshot.$num");
			}
		}	
		print "Creating snapshot $num\n";
	}
}


if (@ARGV==2 && $ARGV[0] eq "load"){
	$num=&lastseq();
	mkdir( ".snapshot.$num"  ) or die "cannot create '.snapshot.$num' !";
	foreach $f3 (glob "*"){
		if ($f3 !~ ".*\.pl"){
	copy("$f3",".snapshot.$num");
		}
	}	
	print "Creating snapshot $num\n";

	foreach $f4 (glob " ./.snapshot.$ARGV[1]/*"){
	copy("$f4","./");
	}	
	print "Restoring snapshot $ARGV[1]\n"
}









