#!/bin/bash

book sm
python3 gitbook-auto-summary.py  .

b() {
lines_README=`cat SUMMARY-GitBook-auto-summary.md  |grep "*" |grep README |grep -v "序言"  | awk '{print $2}'`

for line_README in $lines_README
do 
 echo $line_README
  line_README=${line_README//\//\\\/}
  line_README=${line_README//\[/\\[}
  line_README=${line_README//\]/\\]}
  line_README=${line_README//\(/\\\(}
  line_README=${line_README//\)/\\\)}
  line_README=${line_README//\-/\\\-}
 sed -r -i "/$line_README/d" SUMMARY-GitBook-auto-summary.md
done

}

b

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


