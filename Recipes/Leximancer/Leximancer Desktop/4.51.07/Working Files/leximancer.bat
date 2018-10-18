@echo off
Setlocal EnableDelayedExpansion

for /F "tokens=3* delims= " %%U in ('reg query "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Personal ^| find /i "REG_EXPAND_SZ"') do (
                set remote=%%U\leximancerprojects
                set home=%%U
)

REM Expand remote
for /F %%V in ('echo %remote%') do set remote=%%V

if NOT EXIST "!remote!" mkdir "!remote!"

if "%remote:~0,2%" == "\\" goto drivemap
goto setvar

:drivemap
set drive=
:check
for /f "delims=*" %%a in ('net use ^| find "%remote%"') do set drive=%%a
if NOT DEFINED drive net use * "%remote%" /persistent:NO>nul & goto check
set LEXUSERDIR=file:///%drive:~13,2%

:setvar
if NOT DEFINED LEXUSERDIR set LEXUSERDIR=file:///!remote:\=/!
echo LEXUSERDIR set to %LEXUSERDIR%

leximancer.exe
