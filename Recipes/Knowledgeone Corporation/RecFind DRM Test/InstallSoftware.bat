SET SOURCE=%~dp0..\Source
SET WORK=%~dp0

cd "%SOURCE%"
echo Installing Software
RF6_29_DRM.exe /S /v"/qb CM_SERVERNAME=\"recfindtest.usc.edu.au\" CM_SYSTEMNAME=\"RecFind Test\""

echo Installing Config File
copy "%WORK%Configuration Files\TEST\RecFind_DRM_629\DRM.exe.config" "C:\Program Files (x86)\Knowledgeone Corporation\RecFind 6\DRM\" /y

echo Deleting bad shortcuts
del "C:\Users\Public\Desktop\RecFind 6 DRM.lnk"
ren "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Knowledgeone Corporation\RecFind 6\DRM.lnk" "DRM Test 6.2.9.lnk"