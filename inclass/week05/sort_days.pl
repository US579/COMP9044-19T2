use Data::Dumper qw(Dumper);
@days = qw/Sunday Monday Tuesday Wednesday Thursday Friday Saturday/;
# Perl allows you to assign to multiple values in a hash simultaneously
@days{@days} = (0..10);
print Dumper \%days;
@days = keys %days;
#print @days;
sub random_day {
    my @days = keys %days;
    return $days[rand @days];
}

sub compare_day {
    return $days{$a} <=> $days{$b};
}

push @random_days, random_day() foreach 1..5;
#print "random days = @random_days\n";
@sorted_days = sort compare_day @random_days;
print "sorted days = @sorted_days\n";
