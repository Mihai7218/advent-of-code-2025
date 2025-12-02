#!/usr/bin/perl

use strict;
use warnings;

sub part1 {
    my $v = 50;
    my $c = 0;
    foreach my $line (@_) {
        my $motion = substr($line, 0, 1);
        my $value = substr($line, 1, 3);
        if ($motion eq "L") {
            $v -= $value;
        } else {
            $v += $value;
        }
        $v %= 100;
        if ($v == 0) {
            $c++;
        }
    }
    return $c;
}

sub part2 {
    my $v = 50;
    my $c = 0;
    foreach my $line (@_) {
        my $motion = substr($line, 0, 1);
        my $value = substr($line, 1, 3);
        if ($motion eq "L") {
            if ($v == 0) {
                $v = 100;
            }
            if ($value - $v >= 0) {
                $c += int(($value - $v)/100);
                $c++;
            }
            $v -= $value;
        } else {
            if (($value - (100 - $v)) >= 0) {
                $c += int(($value - (100 - $v))/100);
                $c++;
            }
            $v += $value;
        }
        $v %= 100;
    }
    return $c;
}

open (my $fh, "<", "day1/input") or die "File not found";
my @input;
while (<$fh>) {
    push @input, $_;
}

print part1(@input) . "\n";
print part2(@input) . "\n";
