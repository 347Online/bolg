#!/usr/bin/env perl
my $dir = @ARGV[0] // ".";

opendir (DIR, $dir) or die "Couldn't open directory, $!";
foreach (grep(/^[^\.].*\.md$/, readdir(DIR))) {
  my $fname = `readlink -f $dir/$_`; 
  chomp($fname);
  my $out = $fname =~ s/.md/.html/r;
  my $f = $fname;
  open(FH, ">", $out) or die $!;
  my $html = `markdown $f`;
  print FH $html;
  close(FH);
}

closedir DIR
