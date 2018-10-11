@echo off
Set SOURCE=%~dp0..\Source\Img
Echo Installing prereqs from "%SOURCE%"

echo VCREDIST2010SP1X64
start /wait "" "%SOURCE%\3rdParty\x64\VCRedist\2010SP1\vcredist_x64.exe" /q /norestart /l %temp%\vcredist_x64_2010.log
echo VCREDIST2010SP1X86
start /wait "" "%SOURCE%\3rdParty\x86\VCRedist\2010SP1\vcredist_x86.exe" /q /norestart /l %temp%\vcredist_x86_2010.log 
echo VCREDIST2012X64UPD4
start /wait "" "%SOURCE%\3rdParty\x64\VCRedist\2012UPD4\vcredist_x64.exe" /install /quiet /norestart /log %temp%\vcredist_x64_2012_UPD4.log 
echo VCREDIST2012X86UPD4
start /wait "" "%SOURCE%\3rdParty\x86\VCRedist\2012UPD4\vcredist_x86.exe" /install /quiet /norestart /log %temp%\vcredist_x86_2012_UPD4.log 
echo VCREDIST2015X64
start /wait "" "%SOURCE%\3rdParty\x64\VCRedist\2015\vcredist_x64.exe" /q /norestart 
echo VCREDIST2015X86
start /wait "" "%SOURCE%\3rdParty\x86\VCRedist\2015\vcredist_x86.exe" /q /norestart
echo VCREDIST2008X86SP1
start /wait "" "%SOURCE%\3rdParty\x86\VCRedist\2008SP1\vcredist_x86.exe" /q
echo VCREDIST2008X64SP1
start /wait "" "%SOURCE%\3rdParty\x64\VCRedist\2008SP1\vcredist_x64.exe" /q
echo VCREDIST2013X64
start /wait "" "%SOURCE%\3rdParty\x64\VCRedist\2013\vcredist_x64.exe" /install /quiet /norestart
echo VCREDIST2013X86
start /wait "" "%SOURCE%\3rdParty\x86\VCRedist\2013\vcredist_x86.exe" /install /quiet /norestart
echo DIRECTX
start /wait "" "%SOURCE%\3rdParty\DirectX\DXSETUP.exe" /silent
echo 172.29.93.5 sdlic10.usc.internal >> C:\Windows\System32\drivers\etc\hosts
