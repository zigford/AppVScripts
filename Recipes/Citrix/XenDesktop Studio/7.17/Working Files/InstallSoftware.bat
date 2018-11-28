SET SOURCE=%~dp0..\Source
SET WORK=%~dp0

cd "%SOURCE%"
echo Installing Software
start /wait "" "x64\XenDesktop Setup\XenDesktopServerSetup.exe" /components desktopstudio /passive

echo Fixing shortcuts
ren "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Citrix\Citrix Studio.lnk" "Citrix Studio 7.17.lnk" 