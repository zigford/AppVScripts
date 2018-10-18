SETLOCAL EnableDelayedExpansion
SET SOURCE=%~dp0..\Source
SET WORK=%~dp0
SET INSTALLDIR=C:\Program Files\Leximancer-Desktop-V4

cd "%SOURCE%"
echo Installing Software
start /wait "" Leximancer-4.51.07.exe /VERYSILENT

echo Installing license
copy license.lic "%INSTALLDIR%\license.key"

echo Create config file

cd "%INSTALLDIR%\config\lex3"
if exist lmserver.desktop.properties.local del lmserver.desktop.properties.local

for /f "tokens=* delims=]" %%a in (lmserver.properties.local.admin) do (
set str=%%a
set str=!str:sys:lexuserdir=env:LEXUSERDIR!
echo !str!>> lmserver.desktop.properties.local
)

echo Installing Batch file
cd "%INSTALLDIR%"
copy "%WORK%leximancer.bat" .\

echo Deleting bad shortcuts
del "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Leximancer 4\Uninstall Leximancer4.51.lnk"

cd "%WORK%"
echo Updating main shortcut
powershell.exe -exe bypass -Noprofile -File Set-Shortcut.ps1 "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Leximancer 4\Leximancer4.51.lnk" "%INSTALLDIR%\leximancer.bat" "%INSTALLDIR%\lex.ico"
