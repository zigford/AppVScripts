@echo off
REM ==============================================================
REM =                                                            =
REM = This is a prereq installer for RStudio.                    =
REM =                                                            =
REM ==============================================================

Set SOURCE=%~dp0..\Source
cd "%SOURCE%"
Echo Installing prereqs from "%SOURCE%"
start /wait "" R-3.5.1-win.exe /SILENT /NORESTART /LOG="C:\BuildLogs\rinstall.log"
start /wait "" Rtools34.exe /SILENT
