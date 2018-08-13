SET SOURCE=%~dp0..\Source
SET WORK=%~dp0
SET VERSION=9.4.0.13

cd "%SOURCE%"
echo Installing Software
msiexec /i Viber.msi TRANSFORMS="%WORK%USC.mst" /qb REBOOT=REALLYSUPPRESS
