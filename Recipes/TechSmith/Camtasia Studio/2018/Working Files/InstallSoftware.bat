SET SOURCE=%~dp0..\Source
SET WORK=%~dp0

cd "%SOURCE%"
echo Installing Software
start /wait "" camtasiaup.exe -s

echo Disable autoupdate
DisableUpdates.bat

echo Renaming shortcuts
ren "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\TechSmith\Camtasia 2018.lnk" "Camtasia 2018 18.0.4.3822.lnk"
ren "%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\TechSmith\Camtasia Recorder 2018.lnk" "Camtasia Recorder 2018 18.0.4.3822.lnk"

echo Deleting bad shortcuts
del "C:\Users\Public\Desktop\Camtasia 2018.lnk"
