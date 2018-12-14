SET SOURCE=%~dp0..\Source
SET WORK=%~dp0

cd "%SOURCE%"
echo Installing Software
SSMS-Setup-ENU.exe /install /passive /norestart

echo Adding version to shortcut name
ren "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft SQL Server Tools 17" "Microsoft SQL Server Tools 17.9.1"
