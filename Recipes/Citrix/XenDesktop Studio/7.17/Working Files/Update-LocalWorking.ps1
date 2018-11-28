## Build scripts are kept seperate from source in order to keep vendor files off github.
## This script simply merges free recipe files with private data for ease of development.
[CmdLetBinding()]
Param([switch]$Whatif)

If ($IsMacOS) {
    $Appdev = '/Volumes/appdev/SCCMSoftware'
} else {
    $Appdev = '\\usc.internal\usc\appdev\SCCMSoftware'
}

If (-Not (Test-Path -Path $Appdev -ErrorAction SilentlyContinue)) {
    Write-Error "Unable to access appdev. Please mount the volume" -ErrorAction Stop
}

function Get-PathArray {
    [CmdLetBinding()]
    Param($Path)
    $Array = @()
    While ($Path) {
        $Leaf = Split-Path -Path $Path -Leaf
        $Array += $Leaf
        $Path = Split-Path -Path $Path -Parent 
    }
    return $Array
}

$PackagePath = Get-PathArray -Path $PSScriptRoot
$Version = $PackagePath[1]
$Product = $PackagePath[2]
$Vendor  = $PackagePath[3]

$PackageSourceDir = $Appdev

For ($i=3; $i -gt 0; $i--) {
    $PackageSourceDir = Join-Path -Path $PackageSourceDir -Child $PackagePath[$i]
}

Write-Output $PackageSourceDir
Copy-Item -Recurse (Join-Path -Path $PSScriptRoot -Child *) (Join-Path -Path $PackageSourceDir -Child "Working Files") -Whatif:$Whatif
