#!/usr/bin/perl -w

$str=$ARGV[0];

print "#!/usr/bin/perl -w\n\n";
print "print \"";
foreach my $x (split (//,$str)) {
	printf "\\x%02x", ord($x);
}
print "\\n\";\n"

