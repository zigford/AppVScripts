SET SOURCE=%~dp0..\Source
SET WORK=%~dp0

cd "%SOURCE%"
echo Installing Software
start /wait "" R-3.5.1-win.exe /SILENT /NORESTART /LOG="C:\BuildLogs\rinstall.log"