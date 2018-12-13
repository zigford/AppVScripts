SET SOURCE=%~dp0..\Source
SET WORK=%~dp0

cd "%SOURCE%"
echo Installing Software
SimCLIM_Desktop_Update_4_10_99_0.exe /SILENT /LOG="C:\BuildLogs\install.log" /NORESTART

echo Changing shortcut names
ren "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CLIMsystems\SimCLIM Desktop\SimCLIM (64-bit).lnk" "SimClim (64-bit) 4.0.lnk"
ren "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CLIMsystems\SimCLIM Desktop\SimCLIM.lnk" "SimClim 4.0.lnk"
ren "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CLIMsystems\SimCLIM Desktop" "SimCLIM Desktop 4.0"

echo Install License file
echo ^<settings^>^

    ^<networkLicense^>true^</networkLicense^>^

    ^<networkLicenseServer^>wsp-license01.usc.internal^</networkLicenseServer^>^

    ^<networkLicenseGroup^>Labs^</networkLicenseGroup^>^

    ^<networkLicensePort^>50250^</networkLicensePort^>^

^</settings^>>"C:\Program Files (x86)\CLIMsystems\SimCLIM Desktop\AppSettings.xml"