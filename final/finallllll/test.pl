$string = "Bradley, Marion Zimmer";
($family_name, $given_name) = $string =~ /([^,]), (\S\S)/;
#print "$given_name $family_name\n";
$a = split(/([#@]+)/, 'ab##@#c#d@@e');
print $a;

$str="Is is the cost of of gasoline going up up";
@arr = $str =~ /\b([a-z]+) \1\b/ig;
print $arr;
