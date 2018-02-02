@echo off

REM =========================APPV SCRIPTING TEMPLATE v1.3.1==============================
REM ==================================Notes============================================
REM Changes from v1.3 - 24/01/2018
REM  Bugfix Prereqs now install and log to %BUILDLOGS%
REM Changes from v1.2 - 19/01/2018
REM  Temp installer appvinstall.bat file is executed with poweshell so that the command
REM  Tee-Object can be used to capture output into %BUILDLOGS%
REM Changes from v1.1 - 16/03/2017
REM  Added specfile.bat support. No longer modify this file. Put your variables in a
REM   file called specfile.bat. example:
REM
REM	specfile.bat
REM
REM     Set INSTALLER=InstallSoftware.bat
REM 	Set PACKAGENAME=Autodesk_Revit_2017_APPV_Site_WKS
REM 	Set PVAD=C:\Program Files\Autodesk
REM		Set PREREQS=Prereqs.ps1
REM		Set APPVTemplate=autodesk.appvt
REM
REM Changes from v1.0 - 16/03/2017
REM  Uses robocopy to provision source as its faster with many smaller files.
REM
REM Changes from v0
REM  Added support for APPVTemplate
REM ==================================/Note============================================

REM =================================Do Not Modify=====================================
SetLocal EnableDelayedExpansion
Call "%~dp0specfile.bat"
Set DESKTOP=%USERPROFILE%\Desktop
Set BUILDDATA=%DESKTOP%\BuildData
Set SOURCE=%BUILDDATA%\Source
Set WORKINGFILES=%BUILDDATA%\Working Files
Set INSTALLERFP=%WORKINGFILES%\%INSTALLER%
IF NOT EXIST "%BUILDLOGS%" mkdir "%BUILDLOGS%"

REM =================================Provision Source==================================
if NOT EXIST "%WORKINGFILES%" (
  if NOT EXIST "%SOURCE%" robocopy "%~dp0..\Source" "%SOURCE%" /E /MT:25 /NP /NFL /NDL
  xcopy "%~dp0*.*" /s "%WORKINGFILES%" /y /I
  echo. >> "%WORKINGFILES%\CreatePackage.bat"
  echo echo Copying package to appdev >> "%WORKINGFILES%\CreatePackage.bat"
  echo xcopy "%DESKTOP%\%PACKAGENAME%" "%~dp0..\APPV\%PACKAGENAME%\" /s /y >> "%WORKINGFILES%\CreatePackage.bat"
  copy "%WORKINGFILES%\CreatePackage.bat" "%WORKINGFILES%\GenPackage.bat"
)
REM ================================Elevation Code=====================================
if EXIST c:\windows\testpath (rmdir c:\windows\testpath) else (mkdir c:\windows\testpath)
if ERRORLEVEL 1 goto ELEVATE
if ERRORLEVEL 0 goto RUNPS
goto END
:ELEVATE
  echo UAC Elevation %WORKINGFILES%\GenPackage.bat
  powershell.exe -Command "&{start-process -FilePath '%WORKINGFILES%\GenPackage.bat' -verb runAs}"
  goto END
:RUNPS
  if NOT "%~n0" == "GenPackage" (
    echo "Already elevated"
    powershell.exe -Command "&{start-process -FilePath '%WORKINGFILES%\GenPackage.bat' -verb runAs}"
    goto END
  )
  REM =================================Execution=======================================
  if DEFINED PREREQS (
    echo Installing Prereqs from %WORKINGFILES%\%PREREQS%
    cd "%WORKINGFILES%"
    start /wait "" powershell.exe -NoProfile -Ex Bypass -Command "& '.\%PREREQS%' | Tee-Object '%BUILDLOGS%\%PREREQS%.log'"
  )
  Set TI=%WORKINGFILES%\appvinstall.bat
  REM Make a temp install file
  ECHO REM Temp Install File > "%TI%"
  ECHO cd "%WORKINGFILES%" >> "%TI%"
  ECHO ECHO Running %INSTALLERFP% >> "%TI%"
  ECHO powershell.exe -Command "&{& '.\%INSTALLER%' | Tee-Object '%BUILDLOGS%\%INSTALLER%.log'}" >> "%TI%"
  Set SEQUENCEROPTIONS=-Installer '%TI%' -Name '%PACKAGENAME%' -Path '%DESKTOP%'
  If DEFINED PVAD (
    Set SEQUENCEROPTIONS=!SEQUENCEROPTIONS! -PrimaryVirtualApplicationDirectory '!PVAD!'
  )
  If DEFINED APPVTemplate (
    Set SEQUENCEROPTIONS=!SEQUENCEROPTIONS! -TemplateFilePath '!WORKINGFILES!\!APPVTemplate!'
  )
  ECHO Exec: New-AppVSequencerPackage %SEQUENCEROPTIONS%"
  powershell.exe -Command "&{New-AppvSequencerPackage %SEQUENCEROPTIONS%}"
  goto SUCCESS
:SUCCESS
  if EXIST "%BUILDLOGS%" xcopy "%BUILDLOGS%\*.*" %DESKTOP%\BUILDLOGS\
  goto END
:END
