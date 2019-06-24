
#!/usr/bin/perl -w

$max_lines =10;


if (@ARGV == 0) { 
@lines = <>; 
$first = @lines - $max_lines; 
$first = 0 if $first < 0; 
print @lines[$first..$#lines]; }
