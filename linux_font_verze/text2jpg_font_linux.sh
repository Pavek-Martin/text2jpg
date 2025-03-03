#!/usr/bin/bash

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
for (( bb = 0; bb <= $d_pole_barvy -1; bb++)); do echo $bb" - "${pole_barvy[$bb]}; done
help=${0##*/}
echo $help' $1 = velikost fontu 72,48,36,28,26,24,22,20,18,16,14,12,10,9,8'
echo $help' $2 = barva text obrazku 0-14'
echo $help' $3 barva pozadi obrazku 0-14'
echo $help' $4 = text obrazku'
echo $help" napr."
echo $help" 200 0 13 text"
echo $help' 200 0 13 "text na vice slov takto do uvozovek"'
exit 1
fi

for (( cc = 0; cc <= $d_pole_barvy -1; cc++)); do echo $cc" - "${pole_barvy[$cc]}; done

VelikostFontu=$1 # 72,48,36,28,26,24,22,20,18,16,14,12,10,9,8
# kontrola $1 velikost fontu
#pole_kontrola_velikosti_fontu = (72,48,36,28,26,24,22,20,18,16,14,12,10,9,8)
pole_kontrola_velikosti_fontu=("72" "48" "36" "28" "26" "24" "22" "20" "18" "16" "14" "12" "10" "9" "8")

d_pole_kontrola_velikosti_fontu=${#pole_kontrola_velikosti_fontu[@]}
#echo $d_pole_kontrola_velikosti_fontu

kontrola_font=0
for (( aa = 0; aa <= $d_pole_kontrola_velikosti_fontu -1; aa++)); do
fo=${pole_kontrola_velikosti_fontu[$aa]}
#echo $fo
if [[ $fo -eq $VelikostFontu ]]; then
kontrola_font=1
break
fi
done

if [[ $kontrola_font -eq 0 ]]; then
echo "chyba velikost fontu 72,48,36,28,26,24,22,20,18,16,14,12,10,9,8"
exit
fi

Font="Bookman-DemiItalic"
#Font="Tahoma-DemiItalic" # tady nevim co stim, par veci jsem zkousel ale pise ze font nenasel
echo "Font : "$Font

echo "velikost fontu : "$VelikostFontu

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

VelikostObrazkuX=$(( $DelkaNapis * $VelikostFontu )) # delka obrazky v ose x bude podle velikosti fontu
# fontova verze je jedina verze u ktery je sirka obrazku vzdy v pohode viz. adresar "oprava_delky_textu"
# ale samozdrejme nelze tuto verzi zase pouzit na "androidu"
VelikostObrazkuY=$(( $VelikostFontu + 10 )) # 2x5 pixelu nahore a dole navic
VelikostObrazku=$VelikostObrazkuX"x"$VelikostObrazkuY
echo "velikost obrazku : "$VelikostObrazku

#OutputImageFile=$Napis".jpg" # nazev obrazku bude zadajet text cili argument[2] a format png
OutputImageFile=$(date +%s)".jpg" # do nazvu da stamp, protoze to delalo bordel hlavne diakritika
echo "nazev vystupniho obrazku : "$OutputImageFile

#convert -size 330x140 xc:black -font Bookman-DemiItalic -pointsize 24 -fill white -gravity center -draw "text 0,0 '$out'" n5.png
convert -size $VelikostObrazku xc:$BarvaPozadi -font $Font -pointsize $VelikostFontu -fill $BarvaTextu -gravity center -draw "text 0,0 '$Napis'" $OutputImageFile
echo 'pokud jsi pouzil prohlizec feh pro linux, zmackni klavesu "Q" pro ukonceni'
sleep 2
#feh -F $OutputImageFile # feh je prohlizec obrazku pro linux "sudo apt-get update && sudo apt-get install feh"
#     ^ -F = fullscreen
feh $OutputImageFile # feh je prohlizec obrazku pro linux "sudo apt-get update && sudo apt-get install feh"
#



