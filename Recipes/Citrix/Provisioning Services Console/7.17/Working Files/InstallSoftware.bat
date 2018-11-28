SET SOURCE=%~dp0..\Source
SET WORK=%~dp0

cd "%SOURCE%"
echo Installing Software
start /wait "" PVS_Console_x64.exe /S /V/qb

echo Changing bad shortcuts
ren "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Citrix\Provisioning Services\Provisioning Services Console.lnk" "Provisioning Services Console 7.17.lnk"
del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Citrix\Provisioning Services\Provisioning Services Boot Device Manager.lnk"