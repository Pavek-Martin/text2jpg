@echo off
title txt_file2jpg.bat

REM magick -font Courier-New TEXT:in.txt out.png
REM magick -font Courier-New -pointsize 72 TEXT:in.txt out_2.png

del out_2.jpg
"C:\Program Files (x86)\ImageMagick-7.1.1-Q16\magick.exe" -font Courier-New -pointsize 24 TEXT:in.txt out_2.jpg

del out_3.jpg
magick -font Courier-New -pointsize 16 TEXT:in.txt out_3.jpg

del out_4.jpg
sleep 1
magick -font Courier-New -pointsize 16 -fill blue -background red TEXT:in.txt out_4.jpg

del out_5.jpg
magick -font Courier-New -pointsize 16 -fill white -background black TEXT:in.txt out_5.jpg
REM out_5.jpg bude bilej text na cernem pozadi, velikost fontu 16, font Courier-New
REM jako vstup se vezme soubor "in.txt"


del out_6.jpg
magick -font Courier-New -pointsize 16 -fill white -background black TEXT:in.txt out_6.jpg

magick out_6.jpg -flop out_6_flop.jpg
REM               ^^ obrazek bude otocenej stranove oproti out_6.jpg

magick out_6.jpg -flip out_6_flip.jpg
REM               ^^ obrazek bude otocenej vzhuru nohama oproti out_6.jpg


del tux_2.jpg
magick -font Courier-New -pointsize 16 TEXT:tux.txt tux_2.jpg


REM -font $Font -pointsize $VelikostFontu
REM convert -size $VelikostObrazku xc:$BarvaPozadi -font $Font -pointsize $VelikostFontu -fill $BarvaTextu -
REM gravity center -draw "text 0,0 '$Napis'" $OutputImageFile


sleep 1
pause
@echo on
