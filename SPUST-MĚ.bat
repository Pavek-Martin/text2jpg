@echo off

title text2jpg

REM vypise help
text2jpg.exe

REM EQU - equal
REM NEQ - not equal
REM LSS - less than
REM LEQ - less than or equal
REM GTR - greater than
REM GEQ - greater than or equal

set /p velikost="velikost pisma 50-500 : "
if %velikost% LSS 50 (goto konec)
if %velikost% GTR 500 (goto konec)
echo %velikost%

set /p popredi="zadej barvu text obrazku 0-15 : "
if %popredi% LSS 0 (goto konec)
if %popredi% GTR 15 (goto konec)
echo %popredi%

set /p pozadi="zadej barvu pozadi obrazku 0-15 : "
if %pozadi% LSS 0 (goto konec)
if %pozadi% GTR 15 (goto konec)
echo %pozadi%


set /p text="zadej text obazku : "
echo %text%
REM kontola zd zadna

REM text2jpg.exe %velikost% %popredi% %pozadi% %text%
text2jpg.exe %velikost% %popredi% %pozadi% %text%
pause
goto end

:konec
echo chyba
sleep 2

:end
@echo on




