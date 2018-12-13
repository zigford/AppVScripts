<#
.SYNOPSIS
    Create a new package recipe
.DESCRIPTION
    Create a copy of the package template scripts into a new directory based on the name paramerters provided. Also, attempt to dynamically create specfile.
.PARAMETER Vendor 
    Specify the Vendor of the application Will prompt if not specified
.PARAMETER Product 
    Specify the Product of the application Will prompt if not specified
.PARAMETER Version 
    Specify the Version of the application Will prompt if not specified
.EXAMPLE
    .\New-PackageRecipe.ps1 -Vendor "Adobe" -Product "Reader DC" -Version 2018 -TargetFormat APPV -License Site
.NOTES
    notes
.LINK
    online help
#>
[CmdLetBinding()]
Param(
    $Vendor  =(Read-Host -Prompt "Vendor name"),
    $Product =(Read-Host -Prompt "Product name"),
    $Version =(Read-Host -Prompt "Version"),
    [Parameter(Mandatory=$True)]
    [ValidateSet(
        "APPV",
        "MSI",
        "EXE",
        "Script"    
    )]$TargetFormat,
    [Parameter(Mandatory=$True)]
    [ValidateSet(
        "Open",
        "Site",
        "Restricted"
    )]$License
)

function Join-Directories {
    Param($Paths)
    $Paths | ForEach-Object {
        if (-Not $Path) {
            $Path = $_
        } else {
            $Path = Join-Path -Path $Path -Child $_
        }
    }
    return $Path
}

function Set-SpecFile {
    Param($Path,$PackageName)
    $File = Get-Content -Path $Path
    $NewFile = $File | ForEach-Object {
        If ($_ -match '^Set\sPACKAGENAME=') {
            $_ -replace '=.*',"=$PackageName"
        } else {
            $_
        }
    }
    Set-Content -Path $Path -Value $NewFile
}

$Restriction = Switch ($License) {
    'Restricted' {'Restricted_WKS'}
    'Site'       {'Site_USR,WKS'}
    'Open'       {'Open_USR,WKS'}
}

$RecipeDir = Join-Directories -Paths (Split-Path -Path $PSScriptRoot -Parent),
             "Recipes",
             $Vendor,
             $Product,
             $Version

$NewWorking = New-Item -ItemType Directory -Path $RecipeDir -Name "Working Files" -Force
Copy-Item -Path (Join-Path -Path $PSScriptRoot -Child *) -Exclude $MyInvocation.MyCommand.Name -Destination $NewWorking
Set-Location $NewWorking
Set-SpecFile -Path (Join-Path -Path $NewWorking -Child specfile.bat) `
    -PackageName "${Vendor}_${Product}_${Version}_${TargetFormat}_${Restriction}"
