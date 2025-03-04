#!/usr/bin/bash

#
output_file=3B.jpg
rm -f $output_file
sleep 1

text=Magick

#image_size=320x85
#image_size=220x70
image_size_x=220 # kdyz se definuje tak se znak dolar nepise
image_size_y=70
image_size=$image_size_x"x"$image_size_y # a kdyz se pouziva tak se znak dolar pise

font=Bookman-DemiItalic
font_size=48

#fill=darkred
fill=cyan

#stroke=magenta
stroke=yellow # barvaokraje pisma
#

convert -size $image_size canvas:none -font $font -pointsize $font_size \
-draw "text 25,60 $text'" -channel RGBA -blur 0x6 -fill $fill -stroke $stroke \
-draw "text 20,55 $text" $output_file
# znaky "\" na konci udelaj to, ze jako kdyby to vsechno bylo na jednom radku, dohromady
# convert -size $image_size canvas:none -font $font -pointsize $font_size -draw "text 25,60 $text'" -channel RGBA -blur 0x6 -fill $fill -stroke $stroke -draw "text 20,55 $text" $output_file
# tohle by byl bez toho hodne dlouhej, neprehlednej radek
feh $output_file # apt-get install feh # prohlizec obrazku

