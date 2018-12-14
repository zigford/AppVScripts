@echo off
REM ==============================================================
REM =                                                            =
REM = This is prereq installer for SSMS 17.9.1                   =
REM =                                                            =
REM ==============================================================

Set SOURCE=%~dp0..\Source\SSMSRuntime
Echo Installing prereqs from "%SOURCE%"

echo Installing Visual Studio Shell 2015
start /wait "" "%SOURCE%\vs_isoshell.exe" /passive

echo Installing VS14-KB3095681.exe
start /wait "" "%SOURCE%\VS14-KB3095681.exe" /passive

echo vsta_setup.exe
start /wait "" "%SOURCE%\vsta_setup.exe" /passive

echo vsta_ls.exe
start /wait "" "%SOURCE%\vsta_ls.exe" /passive
