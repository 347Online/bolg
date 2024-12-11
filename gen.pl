opendir (DIR, './posts') or die "Couldn't open directory, $!";
foreach (grep(/^[^\.].*\.md$/, readdir(DIR))) {
  print "$_\n";
}
closedir DIR;
