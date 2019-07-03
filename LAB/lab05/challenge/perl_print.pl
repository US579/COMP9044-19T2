#!/usr/bin/perl -w

$str=$ARGV[0];
# print $str;

print "#!/usr/bin/perl -w\n\n";
#print F '#!/usr/bin/perl -w\n";
print "print \"";
foreach my $x (split (//,$str)) {
	printf "\\x%x", ord($x);
}
print "\\n\";\n"

