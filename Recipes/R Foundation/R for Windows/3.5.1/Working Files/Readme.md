# R for Windows 3.5.1 with RTools 34
Script files to create APPV package of R for Windows.

Author: jpharris

Discovery Date: 12/13/2018 16:22:57

## Discovery Notes for R for Windows

### Installer filename

`R-3.5.1-win.exe`

### Switches or MSI Parameters

| Param                            | Effect                                |
|----------------------------------|---------------------------------------|
| /SILENT                          | Passive dialogs                       |
| /VERRYSILENT                     | No dialogs                            |
| /NORESTART                       | Suppress reboot                       |
| /LOG="C:\BuildLogs\rinstall.log" | Place install logs into buildlogs dir |

### Start menu icons

```
R
 R i386 3.5.1.lnk
 R x64 3.5.1.lnk
```

### Install Dir

`C:\Program Files\R\R-3.5.1\`

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
