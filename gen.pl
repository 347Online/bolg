#!/usr/bin/env perl
my $dir = @ARGV[0] // ".";

opendir (DIR, $dir) or die "Couldn't open directory, $!";
foreach (grep(/^[^\.].*\.md$/, readdir(DIR))) {
  print "$_\n";
}

closedir DIR;
