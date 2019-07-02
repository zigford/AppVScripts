# Nvivo 12
Script files to create package of Nvivo.

Author: Jesse Harris

Discovery Date: 07/02/2019 11:23:35

## Discovery Notes

### Installer filename

setup.exe

### Switches or MSI Parameters

| Param | Effect                                               |
|-------|------------------------------------------------------|
| /S    | Silence Installsheild dialogs                        |
| /v    | Pass params to embedded MSI                          |
| /qb   | parameters passed to MSI for unattended installation |

### Installer filename

`NVivo 12.msi`

### Switches or MSI Parameters

| Param          | Effect                      |
|----------------|-----------------------------|
| ADDLOCAL=ALL   | Specify features            |
| REMOVE=Desktop | Don't add the Desktop icon  |
| /v             | Pass params to embedded MSI |

### Install Dir

`C:\Program Files\QSR\NVivo 12`

### Start menu icons

`
Programs\VendorFolder
         Shortcut.lnk
`

### Registry information

| Attribute            | Value                                                |
|----------------------|------------------------------------------------------|
| Wow6432Node          | false                                                |
| Uninstall Key        | {28ADDB93-754C-4AB8-AAE5-851DBCBA2C1E}               |
| DisplayName          | NVivo 12                                             |
| DisplayVersion       | 12.2.0.443                                           |
| UninstallString      | MsiExec.exe /I{28ADDB93-754C-4AB8-AAE5-851DBCBA2C1E} |
| QuietUninstallString | MsiExec.exe /X{28ADDB93-754C-4AB8-AAE5-851DBCBA2C1E} |

### Configurations

### Disable updates

Update Notification Setting is stored in the `user.config` file in the users
profile.

Example file location for user AppVSeq
`%AppData%\QSR_International\NVivo.exe_Url_tlspedxbfb2g1gu5lzparp5uphbhqukz\12.2.0.443`

    user.config:
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
    <configSections>
        <sectionGroup name="userSettings">
        <section name="QSR.NVivo.Client.Business.Services.RoamingClientApplicationSettings" type="System.Configuration.ClientSettingsSection, System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" allowExeDefinition="MachineToLocalUser" requirePermission="false" />
        </sectionGroup>
    </configSections>
    <userSettings>
        <QSR.NVivo.Client.Business.Services.RoamingClientApplicationSettings>
        <setting name="EnableUpdateNotifications" serializeAs="String">
            <value>False</value>
        </setting>
        <setting name="FirstRun" serializeAs="String">
            <value>False</value>
        </setting>
        <setting name="NextUpdateNotificationDate" serializeAs="String">
            <value>9999-12-31 23:59:59Z</value>
        </setting>
        </QSR.NVivo.Client.Business.Services.RoamingClientApplicationSettings>
    </userSettings>
    </configuration>

### License configuration

Software is activated post installation

        nvivo.exe -i <licence key> -a activationfile.xml

Where activation file contains:

        <?xml version="1.0" encoding="utf-8" standalone="yes"?>
        <Activation>
            <Request>
                <FirstName>Jesse</FirstName>
                <LastName>Harris</LastName>
                <Email>MyEmailAddress</Email>
                <Phone>+61-754-594-692</Phone>
                <Fax></Fax>
                <JobTitle>Client Systems Analyst</JobTitle>
                <Sector>Higher Education</Sector>
                <Industry>Education</Industry>
                <Role>Application Packaging</Role>
                <Department>IT Services</Department>
                <Organization>University of the Sunshine Coast</Organization>
                <City>Sippy Downs</City>
                <Country>Australia</Country>
                <State>Queensland</State>
            </Request>
        </Activation>

### Other software installed

#### QSR NCapture for Chrome

### Registry Information

| Attribute       | Value                                            |
|-----------------|--------------------------------------------------|
| Uninstall Key   | {EB78E6E7-6E0B-4EEE-A485-9361C3500096}           |
| DisplayName     | QSR NCapture for Chrome                          |
| DisplayVersion  | 1.0.220.0                                        |
| UninstallString | MsiExec /X{EB78E6E7-6E0B-4EEE-A485-9361C3500096} |

#### The following are pre-reqs required by Nvivo

### Microsoft Visual C++ 2010 SP1 x64 Redist

`vcredist_2010_x64.exe /q`

### Microsoft Visual C++ 2012 Update 4 x64 Redist

`vcredist_2012_u4_x64.exe /q`

### Microsoft SQL Server 2014 Express LocalDB x64

| Attribute       | Value                                                |
|-----------------|------------------------------------------------------|
| Uninstall Key   | {78426A54-76E9-4F08-A3D6-661289D991A2}               |
| DisplayName     | Microsoft SQL Server 2014 Express LocalDB            |
| DisplayVersion  | 12.2.5000.0                                          |
| UninstallString | MsiExec.exe /I{78426A54-76E9-4F08-A3D6-661289D991A2} |

## Install Command

`msiexec /I SqlLocalDB_x64.MSI" IACCEPTSQLLOCALDBLICENSETERMS=YES /qb`
