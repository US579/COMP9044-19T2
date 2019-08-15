#!/usr/bin/perl -w

$n = shift @ARGV or die "Usage: $0 <n-lines>\n";

sub reader{
    my ($n) = @_;
    my $text = "";
    $text .= <> foreach (1..$n);
    return $text;
}
sub reader2{
    my ($n) = @_;
    my $text = "";
    while ( $n-- > 0){
        $text .= <>;
    }
    return $text;


}
print reader($n);
