#!/usr/bin/perl -w


sub lines2str{
    my $n =@_;
    my $output ="";

    # $output .= $line while ( $line <STDIN>);
    my $i=1;
    while ( $line <STDIN>) {
    	#add line to the sring 
    	$output .= $line;
    	last if ($i++ == $n);
    	# body...
    }
    return $output;
}


sub lines2str2{
for (  my $i=0; $i <$n;$i++){
	$output.=<STDIN>;
}
return $output;
}


# my $n = @_;
# 类似于 a,b,c = [1,2,3]
# a=1;b=2;c=3
# 如果不加bracket 会将the length of arry assign to $n
# so better to write as 
# my ($n) = @_;
