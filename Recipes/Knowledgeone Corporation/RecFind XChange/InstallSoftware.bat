SET SOURCE=%~dp0..\Source
SET WORK=%~dp0

cd "%SOURCE%"
echo Installing Software
RF6_29_Xchange.exe /S /v/qb

echo Installing Config File
copy "%WORK%Configuration Files\PROD\RecFind_Xchange_629\Xchange.exe.config" "C:\Program Files (x86)\Knowledgeone Corporation\RecFind 6\XChange\" /y

echo Deleting bad shortcuts
del "C:\Users\Public\Desktop\Xchange.lnk"
echo Renaming Start menu shortcut
ren "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Knowledgeone Corporation\RecFind 6\Xchange.lnk" "Xchange 6.2.9.lnk"