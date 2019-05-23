# Configuration Manager Console 1810
Script files to create APPV package of Configuration Manager Console.

Author: jpharris

Discovery Date: 01/31/2019 17:16:17

## Discovery Notes

### Installer filename

AdminConsole.msi

### Switches or MSI Parameters

| Param | Effect                                               |
|-------|------------------------------------------------------|
| /qb   | parameters passed to MSI for unattended installation |

### Install Dir

### Start menu icons

`
Programs\VendorFolder
         Shortcut.lnk
`

### Registry information

| Attribute            | Value         |
|----------------------|---------------|
| Wow6432Node          | false         |
| Uninstall Key        | {exampleguid} |
| DisplayName          |               |
| DisplayVersion       |               |
| UninstallString      |               |
| QuietUninstallString |               |

### Configurations

### Disable updates

### License configuration

