#!/usr/bin/perl -w

@vec = map { $_ ** 2 } (1,2,3,4,5);
print "@vec\n";

@a=(1..5);
@b = grep { $_ = $_ - 3; $_ > 0} @a;
print "@a\n";
print "@b\n";

%colours = ("John" => "blue", "Anne" => "red", "Andrew" => "green");
sub print_hash {
    my (%dic) = @_;
    foreach $key (keys %dic){
        print "[$key] => $dic{$key}\n";        
        

    }
}

print_hash(%colours);
