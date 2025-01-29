#!/usr/bin/env bash

mkdir "out"
for x in ./posts/*.md; do
  pandoc -s "$x" -o "out/$(basename "$x" ".md").html"
done
