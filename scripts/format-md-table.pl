#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my @lines = ();
while (my $line = <STDIN>) {
    chomp $line;
    push @lines, $line;
}

my $longest = get_longest(@lines);
#print Dumper($longest);

for my $line (@lines) {
    chomp $line;
    my @f = map { trim($_) } split(/\|/, $line);
    if ($f[0] eq '') {
        shift @f;
    }
    my @p;
    for (my $i = 0; $i < @f; $i++) {
        $p[$i] = pad($f[$i], $longest->[$i]);
    }
    printf("| %s |\n", join(' | ', @p));
}



sub pad {
    my $field = shift;
    my $size = shift;

    while (length($field) < $size) {
        $field .= ' ';
    }
    return $field;
}

sub get_longest {
    my @lines = @_;
    my $cols = [];
    for (my $i = 0; $i < @lines; $i++) {
        my @f = map { trim($_) } split(/\|/, $lines[$i]);
        if ($f[0] eq '') {
            shift @f;
        }
        #print Dumper(\@f);
        for (my $j = 0; $j < @f; $j++) {
            $cols->[$j] ||= 0;
            my $len = length($f[$j]) || 0;
            #printf("$len %s\n", $f[$j]);
            if ($len > $cols->[$j]) {
                $cols->[$j] = $len;
            }
        }
    }
    return $cols;
}

sub trim {
    my $s = shift;
    $s =~ s/^\s+//;
    $s =~ s/\s+$//;
    return $s;
}
