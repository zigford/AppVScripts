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
    'Open'       {'Open,USR_WKS'}
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
