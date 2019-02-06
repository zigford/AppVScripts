# SimClim for Desktop 4.0
Script files to create APPV package of SimClim for Desktop.

Author: jpharris

Discovery Date: 12/13/2018 12:53:23

---

## Discovery Notes

### Installer filename

`SimCLIM_Desktop_Global_4_2_0_222.exe`

### Updater filename

`SimCLIM_Desktop_Update_4_10_99_0.exe`

### Start menu icons
_In the All Users Start-Menu_

    CLIMsystems\SimCLIM Desktop\
        Configuration license manager.lnk
        Default data folder.lnk
        SimCLIM (64-bit).lnk
        SimCLIM.lnk
        Site File View.lnk

### Install Dir

C:\Program Files (x86)\CLIMsystems\SimCLIM Desktop\

### Switches or MSI Parameters
_Works for global install and update_

| Param               | Effect                  |
|---------------------|-------------------------|
| /SILENT             | Silent                  |
| /LOG="C:\BuildLogs" | Save logs into location |
| /NORESTART          | Suppress reboot         |

### Registry information
_As of post update install_

| Attribute            | Setting                                                                   |
|----------------------|---------------------------------------------------------------------------|
| ProductID            | `{17C46D83-764A-4CEC-94A3-D092D1A7962B}_is1`                              |
| DisplayVersion       | 4.10.99.0                                                                 |
| DisplayName          | SimCLIM Desktop                                                           |
| UninstallString      | "C:\Program Files (x86)\CLIMsystems\SimCLIM Desktop\unins000.exe"         |
| QuietUninstallString | "C:\Program Files (x86)\CLIMsystems\SimCLIM Desktop\unins000.exe" /SILENT |

### Configurations

#### License configuration

Place 'AppSettings.xml' into the InstallDir\x86

Example:

        <settings>
            <networkLicense>true</networkLicense>
            <networkLicenseServer>wsp-license01.usc.internal</networkLicenseServer>
            <networkLicenseGroup>Labs</networkLicenseGroup>
            <networkLicensePort>50250</networkLicensePort>
        </settings>

---

## Packager Notes

First run the Global installer then run the updater.
Unfortunatly it doesn't seem like the global installer can fully suppress dialogs. A license window
up during install and I have asked to see if it can be suppressed.

### Notes for future packagers

On first launch, SimClim creates a directory `%LOCALAPPDATA%\ClimSystems\SimCLIM Desktop` which
contains `Settings.ClmConfig`. This XML file contains the path to the simclim data files which
when sequenced non-pvad, will be contain the PackageID\VersionID in their path. The potential issue
with this, is that future updates to the package, this file outside the bubble will have an invalid
path. There are a few idea's to work around this:

* Sequence to PVAD
* Include this directory in the bubble with override enabled.
* Create a launch script which delete, or updates these settings

I've decided to go with the second idea.
