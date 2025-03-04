#!/usr/bin/bash

rm *.png
ls > list.txt
file=list.txt

#typeset -Z4 n=1 # line counter 0-padded to length 4.
#set -o extendedglob

while IFS= read -ru3 line; do
  # remove NUL characters if any:
  line=${line//$'\0'}
  # escape ' and \ characters with \:
  escaped_line=${line//(#m)[\'\\]/\\$MATCH}

  convert -size 1920x1080 \
          xc:black \
          -font Courier-New -pointsize 36 \
          -fill white -background black \
          -gravity center \
          -draw "text 0,0 '$escaped_line'" line$n.png
  (( n++ ))
done 3< $file

