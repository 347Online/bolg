#!/usr/bin/env perl
my $dir = @ARGV[0] // ".";

opendir (DIR, $dir) or die "Couldn't open directory, $!";
foreach (grep(/^[^\.].*\.md$/, readdir(DIR))) {
  my $fname = `readlink -f $dir/$_`; 
  my $in = $fname;
  chomp($in);
  my $out = $in =~ s/.md/.html/r;
  my $f = $in;
  open(FH, ">", $out) or die $!;
  my $html = `markdown $f`;
  print FH $html;
  close(FH);
}

closedir DIR
