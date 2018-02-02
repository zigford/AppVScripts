SET SOURCE=%~dp0..\Source
SET WORK=%~dp0

cd "%SOURCE%"
echo Installing Software
Setup.exe /s
msiexec /i dummy.msi /qb /l* C:\BUILDLOGS\msi.log

echo Deleting bad shortcuts
del "C:\Users\Public\Desktop\Uninstall.lnk"