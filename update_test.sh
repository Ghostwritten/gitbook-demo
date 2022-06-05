#!/bin/bash

book sm
python3 gitbook-auto-summary.py  .

dirs=`grep -E '\- ' SUMMARY-GitBook-auto-summary.md  | awk '{print $2}'`

for dir in $dirs
do
  dir_README=`grep -E "\[${dir}\]" SUMMARY.md | sed 's/^[ \t]*//g'`
  dir_README=${dir_README//\//\\\/}
  dir_README=${dir_README//\[/\\[}
  dir_README=${dir_README//\]/\\]}
  dir_README=${dir_README//\(/\\\(}
  dir_README=${dir_README//\)/\\\)}
  dir_README=${dir_README//\-/\\\-}
  sed -r -i "s#\\- ${dir}\$#$dir_README#g" SUMMARY.md
done



