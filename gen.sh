#!/usr/bin/env bash
shopt -s globstar

in="posts"
out="out"

for x in ./$in/**/*.md; do
  newfile="$(basename "$(echo "$x" | sed "s/$in/$out/")" ".md").html"
  dir="$(dirname $x | sed "s/$in/$out/")"

  mkdir -p "$dir" 2>/dev/null
  pandoc -s "$x" -o "$dir/$newfile"
done
