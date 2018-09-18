SET SOURCE=%~dp0..\Source
SET WORK=%~dp0

cd "%SOURCE%"
echo Installing Software
start /wait "" "Install TEA-Ch 2 (2.0.0).exe" --mode unattended

echo Renaming shortcut
ren "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\TEA-Ch 2\TEA-Ch 2.lnk" "TEA-Ch 2 v2.0.0.lnk"

echo Deleting bad shortcuts
del "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\TEA-Ch 2\Uninstall TEA-Ch 2.lnk"
