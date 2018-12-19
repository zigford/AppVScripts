# SQL Server Management Studio 17.9.1
Script files to create APPV package of SQL Server Management Studio.

Author: jpharris

Discovery Date: 12/10/2018 13:09:57

Credit to [Nick Andreas][1]

## Discovery Notes for SQL Server Management Studio

### Installer filename

`SSMS-Setup-ENU.exe`

### Switches or MSI Parameters

| Param                            | Effect                                |
|----------------------------------|---------------------------------------|
| /install                         | Action = install                      |
| /passive                         | Don't prompt                          |
| /NORESTART                       | Suppress reboot                       |

### Start menu icons

```
Microsoft SQL Server 2017
Microsoft SQL Server Tools
                          Microsoft SQL Server Management Studio.lnk
                          SQL Server Profiler 17.lnk
```

### Install Dir

`C:\Program Files (x86)\Microsoft SQL Server`

### Registry information

Oddly, 2 Uninstall keys exist with almost the same values:

1. {F104D77C-BF7F-4556-97AA-5873CFA7560A}

| Attribute       | Value                                                |
|-----------------|------------------------------------------------------|
| Uninstall Key   | {F104D77C-BF7F-4556-97AA-5873CFA7560A}               |
| Wow6432Node     | False                                                |
| DisplayName     | SQL Server Management Studio                         |
| DisplayVersion  | 14.0.17289.0                                         |
| UninstallString | MsiExec.exe /I{F104D77C-BF7F-4556-97AA-5873CFA7560A} |

2. {EA662F15-4E3A-4DB7-8D41-A2E5B01D90FE}

| Attribute       | Value                                                |
|-----------------|------------------------------------------------------|
| Uninstall Key   | {EA662F15-4E3A-4DB7-8D41-A2E5B01D90FE}               |
| Wow6432Node     | False                                                |
| DisplayName     | SQL Server Management Studio                         |
| DisplayVersion  | 14.0.17289.0                                         |
| UninstallString | MsiExec.exe /I{EA662F15-4E3A-4DB7-8D41-A2E5B01D90FE} |

## Packaging Notes

Some major components of SQL Server Management Studio must be installed
to the local machine outside of the appv bubble. These are listed in Packaging notes as pre-requists:

### Pre-requisits

* Visual Studio Shell 2015
* Visual Studio 2015 KB3095681
* Visual Studio for Applications 2015
* Visual Studio for Applications 2015 Language Packs

#### Visual Studio Shell 2015

##### Install command

`vs_isoshell.exe /Quiet /NoRestart`

##### Uninstall command

`msiexec /x {6CFDA13E-A348-315B-820A-603BBCBD7684} /qn`

##### Evidence

MSI Product code: `{6CFDA13E-A348-315B-820A-603BBCBD7684}` 

#### Visual Studio 2015 KB3095681

##### Install command

`VS14-KB3095681.exe /Quiet /NoRestart`

##### Evidence

Reg Key    : `Software\Microsoft\Windows\CurrentVersion\Uninstall\{2e13383e-8f68-4bb5-959e-9fddd8cb8789}`
Reg Value  : `DisplayVersion`
Reg Type   : String
Bitness    : 32
Operator   : Equals
Data Value : 14.0.23317

#### Visual Studio for Applications 2015

##### Install command

`vsta_setup.exe /Quiet /NoRestart`

##### Uninstall command

`"C:\ProgramData\Package Cache\{ab213ab7-4792-4c6f-a3fa-8485d06c3475}\vsta_setup.exe" /Uninstall /Quiet /NoRestart`

##### Evidence

Reg Key    : `Software\Microsoft\Windows\CurrentVersion\Uninstall\{ab213ab7-4792-4c6f-a3fa-8485d06c3475}`
Reg Value  : `DisplayVersion`
Reg Type   : String
Bitness    : 32
Operator   : Equals
Data Value : 14.0.2829

#### Visual Studio for Applications 2015 Language Packs

##### Install command

`vsta_ls.exe /Quiet /NoRestart`

##### Uninstall command

`"C:\ProgramData\Package Cache\{bd4ef7af-dfb1-472e-8fa4-1b97f360a3e7}\vsta_ls.exe" /uninstall /Quiet /NoRestart`

##### Evidence

Reg Key    : `Software\Microsoft\Windows\CurrentVersion\Uninstall\{bd4ef7af-dfb1-472e-8fa4-1b97f360a3e7}`
Reg Value  : `DisplayVersion`
Reg Type   : String
Bitness    : 32
Operator   : Equals
Data Value : 14.0.23107.20

[1]:https://www.software-virtualisierung.de/app-v/app-v-5-rezept-ssms-17-x-sql-server-management-studio-2016.html
