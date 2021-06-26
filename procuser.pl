#!/usr/bin/perl -w

use strict;

my $line;

print "Radio ID,CallSign,Name,Nickname,City,State/Prov,Country\n";

while (<>) {
    &procline($_) if (/United States/i);
    &procline($_) if (/Australia/i);
    &procline($_) if (/New Zealand/i);
    &procline($_) if (/United Kingdom/i);
}

sub procline {
    my $csvline = shift;
    my @cdata = split(/,/, $csvline);

    print $cdata[0] . ",";      # DMR ID
    print $cdata[1], ",";       # Callsign
    print $cdata[2];
    if (length($cdata[3]) > 1) {
        print " " . $cdata[3] ;   # add last name if given.
    }
    print ",";                  # Full Name
    print $cdata[2] . ",";      # Firstname/nickname
    print $cdata[4] . ",";      # City
    print $cdata[5] . ",";      # State
    print $cdata[6] . "\n";      # Country
}

exit(0);
