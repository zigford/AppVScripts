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

# Get package version, product and vendor from path struct.
$PackagePath = Get-PathArray -Path $PSScriptRoot
$PackageSourceDir = $Appdev

# Assemble Source dir from package path array, create dirs where nessecary.
For ($i=3; $i -gt 0; $i--) {
    $PackageSourceDir = Join-Path -Path $PackageSourceDir -Child $PackagePath[$i]
    If (! (Test-Path -Path $PackageSourceDir)) {
        New-Item -ItemType Directory -Path $PackageSourceDir
    }
}

Write-Output $PackageSourceDir
$WorkingFiles = Join-Path -Path $PackageSourceDir -Child "Working Files"
If (! (Test-Path -Path $WorkingFiles)) {
    New-Item -ItemType Directory -Path $PackageSourceDir -Name "Working Files"
}
Copy-Item -Recurse (Join-Path -Path $PSScriptRoot -Child *) (Join-Path -Path $PackageSourceDir -Child "Working Files") -Whatif:$Whatif
