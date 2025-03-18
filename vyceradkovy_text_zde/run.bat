@echo off

REM echo https://imagemagick.org/script/download.php

del *.jpg
REM copy /v in.txt in_backup.txt
REM copy /v run.bat run_backup.bat
sleep 1

REM C:\Program Files (x86)\ImageMagick-7.1.1-Q16\magick.exe -font Courier-New -pointsize 16 TEXT:in.txt out_1.jpg
magick.exe -font Courier-New -pointsize 16 TEXT:in.txt out_1.jpg

magick.exe -font Courier-New -pointsize 18 TEXT:in.txt out_2.jpg

magick.exe -font Courier-New -pointsize 20 TEXT:in.txt out_3.jpg

magick.exe -font Courier-New -pointsize 22 TEXT:in.txt out_4.jpg

magick.exe -font Courier-New -pointsize 24 TEXT:in.txt out_5.jpg

magick.exe -font Courier-New -pointsize 26 TEXT:in.txt out_6.jpg

magick.exe -font Courier-New -pointsize 28 TEXT:in.txt out_7.jpg

set in=in.txt
set out=out_8.jpg

REM set size=22
set size=20

set fill=yellow
REM set fill=cyan

set background=black
REM set background=black

magick.exe -font Courier-New -pointsize %size% -fill %fill% -background %background% TEXT:%in% %out%

magick.exe -font Courier-New -pointsize 22 -fill %fill% -background %background% TEXT:%in% out_9.jpg

magick.exe -font Courier-New -pointsize 24 -fill %fill% -background %background% TEXT:%in% out_10.jpg

magick.exe -font Courier-New -pointsize 26 -fill %fill% -background %background% TEXT:%in% out_11.jpg

magick.exe -font Courier-New -pointsize 28 -fill %fill% -background %background% TEXT:%in% out_12.jpg

magick.exe -font Courier-New -pointsize 30 -fill %fill% -background %background% TEXT:%in% out_13.jpg

magick.exe -font Courier-New -pointsize 32 -fill %fill% -background %background% TEXT:%in% out_14.jpg

sleep 1

