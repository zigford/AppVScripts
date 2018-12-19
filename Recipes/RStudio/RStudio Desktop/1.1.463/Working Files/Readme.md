# RStudio Desktop 1.1.463
Script files to create APPV package of RStudio Desktop.

Author: jpharris

Discovery Date: 12/17/2018 13:43:49

## Discovery Notes

### Installer filename

RStudio-1.1.463.exe

### Switches or MSI Parameters

| Param | Effect                                               |
|-------|------------------------------------------------------|
| /S    | Silence Installsheild dialogs                        |

### Install Dir

`C:\Program Files\RStudio`

### Start menu icons

`
Programs\RStudio
         RStudio.lnk
`

### Registry information

| Attribute       | Value                                    |
|-----------------|------------------------------------------|
| Wow6432Node     | false                                    |
| Uninstall Key   | RStudio                                  |
| DisplayName     | RStudio                                  |
| DisplayVersion  | 1.1.463                                  |
| UninstallString | `C:\Program Files\RStudio\Uninstall.exe` |

### Configurations

### Disable updates

Set `check_for_updates` to false in %LOCALAPPDATA\RStudio-Desktop\monitored\user-settings\user-settings
