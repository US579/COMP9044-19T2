#!/usr/bin/perl -w


if (@ARGV==0){
	print "backup.pl error: backup.pl <file>";
}


$name=$ARGV[0];
@list=();
if ( ! -e ".$name.0"){
	open F ,"<", "$name" or die "cannot open '$name'";
	foreach $line (<F>){
		push @list , $line;
	}
	close F;
	open A,">" , ".$name.0" or die "cannot open '$name'";
	foreach $i (@list){
		print A "$i";
	}
	close A;
	print "Backup of '$name' saved as '.$name.0'\n";
}
else
{	
	@arry=();
	foreach $file (glob ".*"){
		if ( $file =~ /\.$name\.[0-9]+/ ){
			$file =~ s/.*\.//g;
			push @arry ,$file;

		}
	}
	$seq = (reverse sort @arry)[0];
	$seq += 1;
	open F ,"<", "$name" or die "cannot open '$name'";
	foreach $line (<F>){
		push @list , $line;
	}
	close F;
	open A,">" , ".$name.$seq" or die "cannot open '$name'";
	foreach $i (@list){
		print A "$i";
	}
	close A;
	print "Backup of '$name' saved as '.$name.$seq'\n";
}