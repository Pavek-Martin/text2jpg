#!/usr/bin/bash

rm -f 3A.jpg
sleep 1

text=Magick

convert -size 320x85 canvas:none -font Bookman-DemiItalic -pointsize 72 \
-draw "text 25,60 $text" -channel RGBA -blur 0x6 -fill darkred -stroke magenta \
-draw "text 20,55 $text" 3A.jpg

feh 3A.jpg

