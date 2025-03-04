#!/usr/bin/bash

input=input.jpg

output=output.jpg
rm -f $output
sleep 1

resize=400
resize+=%
echo $resize

colorspace=sRGB
#colorspace=RGB

convert $input -colorspace RGB +sigmoidal-contrast 11.6933 \
-define filter:filter=Sinc -define filter:window=Jinc -define filter:lobes=3 \
-resize $resize -sigmoidal-contrast 11.6933 -colorspace $colorspace $output

feh $output
