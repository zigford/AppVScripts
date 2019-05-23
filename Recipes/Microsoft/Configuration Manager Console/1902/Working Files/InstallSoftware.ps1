Set-PSDebug -Trace 1
$VerbosePreference = 'Continue'
$Source = "$(Split-Path -Path $PSScriptRoot -Parent)\Source"
$Working = $PSScriptRoot
$BuildLogs = "C:\BUILDLOGS"
$Patch = Get-ChildItem -Path $Source -Filter '*.msp'
Start-Transcript -Path "$BuildLogs\ScriptInstall.log"

Write-Verbose "Source: $Source"
Write-Verbose "Working: $Working"
# Prevent popup warning that content comes from untrusted security zone
$env:SEE_MASK_NOZONECHECKS = 1
New-Item -Path $BuildLogs -ItemType Directory -Force
$Args = @{
    FilePath = "$Source\i386\consolesetup.exe"
    ArgumentList = "/q DefaultSiteServername=wsp-configmgr01.usc.internal " + `
        "TargetDir=""C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole"""
    Wait = [switch]$True
}
Write-Verbose ("Running: {0} {1}" -f $Args.FilePath,$Args.ArgumentList)
Start-Process @Args
If ($Patch) {
    Foreach ($p in $Patch.Name) {
        Write-Verbose "Installing Patch $Patch"
        $Args = @{
            FilePath = "msiexec.exe"
            ArgumentList = "/p ""$Source\$p"" /qb /l* ""$BuildLogs\patch.log"""
            Wait = [switch]$True
        }
        Start-Process @Args
    }
}
Write-Verbose "Installing report viewer"
$Args = @{
    FilePath = "$Source\i386\ReportViewer.exe"
    ArgumentList = "/norestart /q"
    Wait = [switch]$True
}
Start-Process @Args
Write-Verbose "Installing right click tools"
$Args = @{
    FilePath = "msiexec.exe"
    ArgumentList = "/i ""$Source\Recast_RCT_Latest.msi"" " `
       + " /l* ""$BuildLogs\rct.log"""
    Wait = [switch]$True
}
Start-Process @Args
Write-Verbose "Installing MDT"
$Args = @{
    FilePath = "msiexec.exe"
    ArgumentList = "/i ""$Source\MicrosoftDeploymentToolkit_x64.msi"" " `
        + "/qb /l* ""$BuildLogs\mdt.log"""
    Wait = [switch]$True
}
Start-Process @Args
Write-Verbose "Registering MDT in Config Manager console"

$ErrorActionPreference = 'Stop'
# Get the CM12 path
$Path =
    (Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\ConfigMgr10\Setup `
        -Name "UI Installation Directory").'UI Installation Directory'
if ($null -ne $Path) {
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
Stop-Transcript
