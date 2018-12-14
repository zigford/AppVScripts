# SQL Server Management Studio 17.9.1
Script files to create APPV package of SQL Server Management Studio.

Author: jpharris

Discovery Date: 12/10/2018 13:09:57

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

| Attribute            | Value                                             |
|----------------------|---------------------------------------------------|
| Uninstall Key        | R for Windows 3.5.1_is1                           |
| DisplayName          | R for Windows 3.5.1                               |
| DisplayVersion       | 3.5.1                                             |
| UninstallString      | "C:\Program Files\R\R-3.5.1\unins000.exe"         |
| QuietUninstallString | "C:\Program Files\R\R-3.5.1\unins000.exe" /SILENT |

## Discovery Notes for R Tools

### Installer filename

`Rtools34.exe`

### Switches or MSI Parameters

| Param                            | Effect                                |
|----------------------------------|---------------------------------------|
| /SILENT                          | Passive dialogs                       |

### Install Dir

`C:\Rtools`

### Registry information

| Attribute            | Value                            |
|----------------------|----------------------------------|
| Wow6432Node          | Yes                              |
| Uninstall Key        | Rtools_is1                       |
| DisplayName          | Rtools 3.4                       |
| DisplayVersion       | N/A                              |
| UninstallString      | "c:\Rtools\unins000.exe"         |
| QuietUninstallString | "c:\Rtools\unins000.exe" /SILENT |
