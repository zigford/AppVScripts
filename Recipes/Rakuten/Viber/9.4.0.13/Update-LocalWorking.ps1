## Build scripts are kept seperate from source in order to keep vendor files off github.
## This script simply merges free recipe files with private data for ease of development.
[CmdLetBinding()]
Param([switch]$Whatif)

$PackageSourceDir = '\\usc.internal\dfs\appdev\SCCMSoftware\Rakuten\Viber'
$Version = '9.4.0.13'
If (-Not (Test-Path -Path "$PackageSourceDir\$Version\Working Files")) {
    New-Item -ItemType Directory -Path $PackageSourceDir\$Version -Name "Working Files"
}
Copy-Item -Recurse $PSScriptRoot\*.* "$PackageSourceDir\$Version\Working Files\" -Whatif:$Whatif
