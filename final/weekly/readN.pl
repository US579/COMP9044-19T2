#!/usr/bin/perl -w

$n = shift @ARGV;
$count=0;

sub readlen{
    my ($n) = @_;
    my $text = "";
    $text .= <> foreach (1..$n);
    return $text;
}

print readlen($n);

