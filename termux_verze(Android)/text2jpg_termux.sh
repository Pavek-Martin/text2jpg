#!/data/data/com.termux/files/usr/bin/bash

# apt-get install imagemagick

pole_barvy=(
"black"       # 0
"blue"        # 1
"cyan"        # 2
"darkblue"    # 3
"darkcyan"    # 4
"darkgray"    # 5
"darkgreen"   # 6
"darkmagenta" # 7
"darkred"     # 8
"gray"        # 9
"green"       # 10
"magenta"     # 11
"red"         # 12
"white"       # 13
"yellow"      # 14
)

d_pole_barvy=${#pole_barvy[@]}

if [ -z "$4" ]; then
for (( aa = 0; aa <= $d_pole_barvy -1; aa++)); do echo $aa" - "${pole_barvy[$aa]}; done
help=${0##*/}
echo $help' $1 = velikost textu 50-500'
echo $help' $2 = barva text obrazku 0-14'
echo $help' $3 barva pozadi obrazku 0-14'
echo $help' $4 = text obrazku'
echo $help" napr."
echo $help" 200 0 13 text"
echo $help' 200 0 13 "text na vice slov takto do uvozovek"'
exit 1
fi

for (( aa = 0; aa <= $d_pole_barvy -1; aa++)); do echo $aa" - "${pole_barvy[$aa]}; done

# velikost textu 50-200  $1
if [[ $1 -lt 50 || $1 -gt 500 ]]; then
echo "chyba velikost textu 50-500"
exit
fi
VelikostTextu=$1
echo "velikost textu : "$VelikostTextu

# barva textu obrazku 0-14 $2
BarvaTextu=$2
if [[ $2 -lt 0 || $2 -gt 14 ]]; then
echo "chyba barva textu 0-14"
exit
fi
BarvaTextu=${pole_barvy[$2]}
echo "barva textu obrazku : "$BarvaTextu

# barva pozadi obrazku 0-14 $3
if [[ $3 -lt 0 || $3 -gt 14 ]]; then
echo "chyba barva pozadi 0-14"
exit
fi
BarvaPozadi=${pole_barvy[$3]}
echo "barva pozadi obrazku : "$BarvaPozadi

# text obrazku ( vcetne diakritiky ) $4
Napis=$4
echo "text obrazku : "$Napis
DelkaNapis=${#Napis}
echo "delka textu "$DelkaNapis" znaku"

VelikostObrazkuX=$(( $DelkaNapis * $(( $VelikostTextu / 2 + 10 )) )) # delka obrazky v ose x bude podle velikosti textu
# radek 71 chce jeste trochu doladit viz screenshoty v adresari oprava "oprava_delky_textu"
VelikostObrazkuY=$(( $VelikostTextu + $(( $VelikostTextu / 2 )) )) # 2x10 pixelu nahore a dole navic
VelikostObrazku=$VelikostObrazkuX"x"$VelikostObrazkuY
echo "velikost obrazku : "$VelikostObrazku

#OutputImageFile=$Napis".jpg" # nazev obrazku bude zadajet text cili argument[2] a format png
OutputImageFile=$(date +%s)".jpg" # do nazvu da stamp, protoze to delalo bordel hlavne diakritika
echo "nazev vystupniho obrazku : "$CestaImage$OutputImageFile

magick -size $VelikostObrazku xc:$BarvaPozadi -pointsize $VelikostTextu -fill $BarvaTextu -gravity center -draw "text 0,0 '$Napis'" $OutputImageFile
sleep 1
mv -v $OutputImageFile ~/downloads/
echo "hotovo"
