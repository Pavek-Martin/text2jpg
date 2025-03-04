#!/usr/bin/bash

convert input.jpg -colorspace RGB +sigmoidal-contrast 11.6933 \
-define filter:filter=Sinc -define filter:window=Jinc -define filter:lobes=3 \
-resize 200% -sigmoidal-contrast 11.6933 -colorspace sRGB output.jpg
