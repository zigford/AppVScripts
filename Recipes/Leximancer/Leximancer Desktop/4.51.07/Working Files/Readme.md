Leximancer Desktop 4.5.1.07
===========================

Discovery
---------

### Switches:

/SILENT /VERYSILENT
/LOG="Filename"
/NORESTART

### Shortcuts

%ALLUSERSPROFILE%\Microsoft\Windows\Start Manu\Programs

├───Programs
    └───Leximancer 4
        ├───Leximancer4.51.lnk
        └───Uninstall Leximancer4.51.lnk

### Installdir

C:\Program Files\Leximancer-Desktop-V4

### Configuration options

#### Redirecting data to another location

1. Copy config/lex3/lmserver.properties.local.admin to lmserver.desktop.properties.local
2. Edit newly copied file and set lexuserdir  to set lexuserdir = ${env:LEXUSERDIR}
3. Inject a batch file to initialize the variable on launch:

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

4. Edit the Leximancer shortcut to point to the bat file instead of leximancer.exe
