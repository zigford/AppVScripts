# SimClim for Desktop 4.0
Script files to create APPV package of SimClim for Desktop.

Author: jpharris

Discovery Date: 12/13/2018 12:53:23

## Discovery Notes

### Installer filename

SimCLIM_Desktop_Update_4_10_99_0.exe

### Start menu icons

    CLIMsystems\SimCLIM Desktop\
        Configuration license manager.lnk
        Default data folder.lnk
        SimCLIM (64-bit).lnk
        SimCLIM.lnk
        Site File View.lnk

### Install Dir

C:\Program Files (x86)\CLIMsystems\SimCLIM Desktop\

### Registry information

| Attribute            | Setting                                                                   |
|----------------------|---------------------------------------------------------------------------|
| ProductID            | {17C46D83-764A-4CEC-94A3-D092D1A7962B}_is1                                |
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

### Switches or MSI Parameters

| Param               | Effect                  |
|---------------------|-------------------------|
| /SILENT             | Silent                  |
| /LOG="C:\BuildLogs" | Save logs into location |
| /NORESTART          | Suppress reboot         |


### Notes

It seems that the installer does not provide any datasets, so might have to deploy 
the dataset after the application is deployed
