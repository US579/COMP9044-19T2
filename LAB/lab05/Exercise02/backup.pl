#!/usr/bin/perl -w




if (@ARGV==0){
	print "backup.pl error: backup.pl <file>";
}

sub max{
	my (@array)=@_;
	my $max = $array[0];
	foreach $i (@array){
		if ($max< $i){
			$max = $i;
		}
	}
	return $max;
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
		if ( $file =~ /\.$name/ ){
			print $file,"\n";
			$file =~ s/.*\.//g;
			chomp($file);
			push @arry ,$file;

		}
	}
	$seq = &max(@arry);
	print @seq;
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