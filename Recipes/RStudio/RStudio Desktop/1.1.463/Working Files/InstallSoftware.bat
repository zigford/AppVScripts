SET SOURCE=%~dp0..\Source
SET WORK=%~dp0
SET SETPATH=%LOCALAPPDATA%\RStudio-Desktop\monitored\user-settings

cd "%SOURCE%"
echo Installing Software
start /wait "" RStudio-1.1.463.exe /S

ren "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\RStudio\RStudio.lnk" "RStudio 1.1.463.lnk"

echo Disable auto updates
mkdir %SETPATH%
echo contextIdentifier="392FE645"^

errorHandlerType="1"^

uiPrefs="{\n    \"check_for_updates\" : false\n}">>%SETPATH%\user-settings
