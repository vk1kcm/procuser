#!/usr/bin/perl

use strict;
use warnings;
use LWP::Simple;

print STDERR "Downloading latest users.csv file\n";

my $radioid = get("https://www.radioid.net/static/user.csv");
die "Download from radioid.net failed" unless defined $radioid;

my @dmrusers = split(/\n/, $radioid);

print STDERR "Generating RT3S compatible csv file\n";

print "Radio ID,CallSign,Name,Nickname,City,State/Prov,Country\n";

foreach (@dmrusers) {
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

print STDERR "Done\n";

exit(0);
