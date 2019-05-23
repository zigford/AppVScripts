Set-PSDebug -Trace 1
$VerbosePreference = 'Continue'
$Source = "$(Split-Path -Path $PSScriptRoot -Parent)\Source"
$Working = $PSScriptRoot
$BuildLogs = "C:\BUILDLOGS"
$Patch = Get-ChildItem -Path $Source -Filter '*.msp'
Start-Transcript -Path "$BuildLogs\ScriptInstall.log"

Write-Verbose "Source: $Source"
Write-Verbose "Working: $Working"
$env:SEE_MASK_NOZONECHECKS = 1 # Prevent popup warning that content comes from untrusted security zone
New-Item -Path $BuildLogs -ItemType Directory -Force
Write-Verbose "Running: msiexec /i ""$Source\i386\AdminConsole.msi"" /qb /l* ""$BuildLogs\sccmlog.log"" TRANSFORMS=""$Source\ConfigManager.mst"""
Start-Process -FilePath msiexec.exe -ArgumentList "/i ""$Source\i386\AdminConsole.msi"" /qb /l* ""$BuildLogs\sccmlog.log"" TRANSFORMS=""$Source\ConfigManager.mst""" -Wait
If ($Patch) {
    Foreach ($p in $Patch.Name) {
        Write-Verbose "Installing Patch $Patch"
        Start-Process -FilePath msiexec.exe -ArgumentList "/p ""$Source\$p"" /qb /l* ""$BuildLogs\patch.log""" -Wait
    }
}
Write-Verbose "Installing report viewer"
Start-Process -FilePath "$Source\i386\ReportViewer.exe" -ArgumentList "/norestart /q" -Wait
Write-Verbose "Installing right click tools"
Start-Process -FilePath msiexec.exe -ArgumentList "/i ""$Source\Recast_RCT_Latest.msi"" /l* ""$BuildLogs\rct.log""" -Wait
Write-Verbose "Installing MDT"
Start-Process -FilePath msiexec.exe -ArgumentList "/i ""$Source\MicrosoftDeploymentToolkit_x64.msi"" /qb /l* ""$BuildLogs\mdt.log""" -Wait
Write-Verbose "Registering MDT in Config Manager console"
& "$Source\ConfigureConfigMgrIntegration.ps1"
Stop-Transcript
