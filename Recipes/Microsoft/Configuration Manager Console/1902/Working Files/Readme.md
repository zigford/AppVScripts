# Configuration Manager Console 1902
Script files to create APPV package of Configuration Manager Console.

Author: jpharris

Discovery Date: 05/23/2019 15:39:00

## Discovery Notes

### Installer filename

ConsoleSetup.exe

*Note, AdminConsole.MSI installation method is no longer supported as of 1809*

### Switches or MSI Parameters

| Param                      | Effect                                        |
|----------------------------|-----------------------------------------------|
| /q                         | Quiet                                         |
| DefaultSiteServerName=fqdn | Specify the default site server to connect to |
| TargetDir                  | Specify installation directory                |

*Note, all three parameters are required for a succesfull silent/unattended
install*
*Note, TargetDir must not end with a \

### Install Dir

`C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\`

### Start menu icons

`
Programs\Microsoft System Center\Configuration Manager\
         Configuration Manager Console.lnk
         Remote Control Viewer.lnk
`

### Registry information

| Attribute            | Value                                            |
|----------------------|--------------------------------------------------|
| Wow6432Node          | true                                             |
| Uninstall Key        | {CEC93134-0862-481E-842F-A19417FD5E12}           |
| DisplayName          | System Center Configuration Manager Console      |
| DisplayVersion       | 5.1902.1085.1000                                 |
| UninstallString      | MsiExec /X{CEC93134-0862-481E-842F-A19417FD5E12} |
| QuietUninstallString | N/A                                              |

### Configurations

After installing MDT, you must install the extensions to the console.
This is normally done using a the `Configure ConfigMgr Integration`
shortcut, but can also be scripted:

        $ErrorActionPreference = 'Stop'
        # Get the CM12 path
        $Path = 
            (Get-ItemProperty HKLM:\Software\Microsoft\ConfigMgr10\Setup `
                -Name "UI Installation Directory").'UI Installation Directory'
        if ($Path -ne $null) {
            $mdtPath =
                (Get-ItemProperty "HKLM:\Software\Microsoft\Deployment 4" `
                    -Name Install_Dir).Install_Dir

            # Copy needed DLLs
            
            'Microsoft.BDD.CM12Actions.dll',
            'Microsoft.BDD.Workbench.dll',
            'Microsoft.BDD.ConfigManager.dll',
            'Microsoft.BDD.CM12Wizards.dll',
            'Microsoft.BDD.PSSnapIn.dll',
            'Microsoft.BDD.Core.dll' | ForEach-Object {
                Copy-Item "$mdtPath\Bin\$_" -Destination "$Path\Bin"
            }

            # Copy extensions folder
            Copy-Item -Path "$mdtPath\Templates\CM12Extensions" `
                -Destination "$Path\XmlStorage\Extensions" -Force -Recurse
        }

### Other Software installed

# Microsoft Report Viewer

### Installer filename

`i386\ReportViewer.exe`

### Switches or MSI Parameters

| Param      | Effect                |
|------------|-----------------------|
| /q         | Be quiet              |
| /norestart | Don't cause a restart |

# Recast Right Click tools

### Installer filename

`Recast_RCT_Latest.msi`

### Switches or MSI Parameters

| Param | Effect          |
|-------|-----------------|
| /qb   | Passive Install |
| /l\*  | Verbose logs    |

### Configurations

A current [bug][1] in RCT causes the console to slow dramatically when it checks
the users permissions for each right click action. To work around this, simply
disable the 'Check permissions feature'.

While this feature can be disabled during installation, the MSI is written in
such a way as the feature cannot be disabled using an MSI property. The
following will describe creating a transform using InstEd

# Microsoft Deployment Toolkit

### Installer filename

`MicrosoftDeploymentToolkit_x64.msi`

### Switches or MSI Parameters

| Param | Effect          |
|-------|-----------------|
| /qb   | Passive install |
| /l\*  | Verbose logs    |

[1]:https://www.reddit.com/r/SCCM/comments/9ixocu/nowmicrorecast_right_click_tools/
