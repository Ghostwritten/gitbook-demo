#!/bin/bash

cp SUMMARY-GitBook-auto-summary.md SUMMARY-GitBook-auto-summary2.md

a() {
cat SUMMARY-GitBook-auto-summary2.md  |grep "*" |grep README |grep -v "序言"  | awk '{print $2}'> /tmp/README_line_README.txt
while read  -r line_README
do
 echo $line_README
  line_README=${line_README//\//\\\/}
  line_README=${line_README//\[/\\[}
  line_README=${line_README//\]/\\]}
  line_README=${line_README//\(/\\\(}
  line_README=${line_README//\)/\\\)}
  line_README=${line_README//\-/\\\-}
 sed -r -i "/$line_README/d" SUMMARY-GitBook-auto-summary2.md
done < /tmp/README_line_README.txt
}

b() {
lines_README=`cat SUMMARY-GitBook-auto-summary2.md  |grep "*" |grep README |grep -v "序言"  | awk '{print $2}'`

for line_README in $lines_README
do 
 echo $line_README
  line_README=${line_README//\//\\\/}
  line_README=${line_README//\[/\\[}
  line_README=${line_README//\]/\\]}
  line_README=${line_README//\(/\\\(}
  line_README=${line_README//\)/\\\)}
  line_README=${line_README//\-/\\\-}
 sed -r -i "/$line_README/d" SUMMARY-GitBook-auto-summary2.md
done

}

b
