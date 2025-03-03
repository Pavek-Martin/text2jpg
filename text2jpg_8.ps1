#cls

# kontola programu ImageMagick
#$magick = ( "C:\Program Files (x86)\ImageMagick\magick.exe" )
$magick = ( "C:\Program Files (x86)\ImageMagick-7.1.1-Q16\magick.exe" ) # tady zadat kde je soubor magick.exe
if ( -not (Test-Path $magick )) {
echo "nenalezen soubor $magick"
echo "https://imagemagick.org/script/download.php"
sleep 5
Exit
}

echo "program - text2.jpg"

# barvy obrazku
$PoleBarvy = @(
"black",       # 0
"blue",        # 1
"cyan",        # 2
"darkblue",    # 3
"darkcyan",    # 4
"darkgray",    # 5
"darkgreen",   # 6
"darkmagenta", # 7
"darkred",     # 8
"gray",        # 9
"green",       # 10
"magenta",     # 11
"red",         # 12
"white",       # 13
"yellow"       # 14
)

$d_PoleBarvy = $PoleBarvy.Length -1

# vyhodnoceni vstupnich argumentu
$delka_args = $args.length
if ( $delka_args -ne 4 ) { #int32

#echo "0 - black" # nebylo by jinak vydet na cernym pozadi
Write-host -ForegroundColor Black -BackgroundColor white "0 - black"
for ($aa = 1; $aa -le $d_PoleBarvy; $aa++) {
$barva = [string] $aa + " - " + $PoleBarvy[$aa]
Write-host -ForegroundColor $PoleBarvy[$aa] $barva
}
echo ""
echo 'args[0] = velikost pisma obrazku 50-500'
echo 'args[1] = barva textu obrazku 0-15'
echo 'args[2] = barva pozadi obrazku 0-15'
echo 'args[3] = text v obrazku'
echo "např."
echo "text2jpg 200 0 14 text"
echo 'text2jpg 200 0 14 "text na vice slov takto do uvozovek"'
echo 'text2jpg 200 0 14 "v obrázku lze mít také české znaky"'
sleep 10
Exit
}

for ($aa = 0; $aa -le ($delka_args - 1); $aa ++) {
$k = "args[" + $aa + "]" + " = " + '"' + $args[$aa] + '"'
echo $k
}

[int32] $VelikostPisma=$args[0]
#echo $ VelikostPisma.GetType()

if (( $VelikostPisma -lt 50 ) -or ( $VelikostPisma -gt 500 )) {
echo "chyba velikosti pisma, pismo v rozsahu 50-500"
sleep 5
Exit
}
echo "velikost textu : $VelikostPisma"

# barva pisma jpg
[int] $f = $args[1]
if (( $f -lt 0 ) -or ( $f -gt 14 )) {
echo "chyba barva pisma, pismo v rozsahu 0-14"
sleep 5
Exit
}
[string] $BarvaTextu = $PoleBarvy[$args[1]]
echo "barva textu obrazku : $BarvaTextu"

# barva pozadi jpg
[int] $b = $args[2]
if (( $b -lt 0 ) -or ( $b -gt 14 )) {
echo "chyba barva pozadi, pozadi v rozsahu 0-14"
sleep 5
Exit
}
[string] $BarvaPozadi = $PoleBarvy[$args[2]] # yellow 
echo "barva pozadi obrazku : $BarvaPozadi"


[string] $Napis=$args[3]
# bez osetreni vstupu
echo "text obrazku : $Napis"

$DelkaNapis = $Napis.Length
echo "delka textu : $DelkaNapis"

# vypocet potrebne velikosti obrazku, podle delky zadaneho text ( nejni to spatny ale este by to chtelo trochu doladit )
$VelikostObrazkuX = (( $DelkaNapis * (( $VelikostPisma / 2 + 10 )) )) # delka obrazky v ose x bude podle velikosti fontu
# radek 103 by chtel jeste doladit, hlavne pro velkou abecedu kde je pismo sirsi 
$VelikostObrazkuY = (( $VelikostPisma + (( $VelikostPisma / 2 )) )) # 2x10 pixelu nahore a dole navic
[string] $VelikostObrazku = [string] $VelikostObrazkuX + "x" + [string] $VelikostObrazkuY
echo "velikost obrazku : $VelikostObrazku"

# nazev souboru obrazku
$DateTime = Get-Date
$stamp = ([DateTimeOffset]$DateTime).ToUnixTimeSeconds()

# nazev jpg obrazku
[string] $OutputImageFile = $stamp
$OutputImageFile += ".jpg" # bude stamp a pripona jpg ( windows umi nahledy takze bez problemu )
#$OutputImageFile.GetType()
echo "nazev vystupniho obrazku : $OutputImageFile"

# samotnej prikaz pro prevod txt -> jpg
#& magick -size $VelikostObrazku xc:$BarvaPozadi -pointsize $ VelikostPisma -fill $BarvaTextu -gravity center -draw "text 0,0 '$Napis'" $OutputImageFile
& magick -size $VelikostObrazku xc:$BarvaPozadi -pointsize $VelikostPisma -fill $BarvaTextu -gravity center -draw "text 0,0 '$Napis'" $OutputImageFile
sleep 1
echo "hotovo"

