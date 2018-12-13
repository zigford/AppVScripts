@echo off
Set SOURCE=%~dp0..\Source\Support
Echo Installing prereqs from "%SOURCE%"

echo VCREDIST2015X64
start /wait "" "%SOURCE%\VcRedist_2015\vcredist_x64.exe" /q /norestart 
echo VCREDIST2015X86
start /wait "" "%SOURCE%\VcRedist_2015\vcredist_x86.exe" /q /norestart 
