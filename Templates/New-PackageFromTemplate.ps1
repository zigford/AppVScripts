[CmdLetBinding()]
Param(
    $Vendor  =(Read-Host -Prompt "Vendor name"),
    $Product =(Read-Host -Prompt "Product name"),
    $Version =(Read-Host -Prompt "Version")
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

$RecipeDir = Join-Directories -Paths (Split-Path -Path $PSScriptRoot -Parent),
             "Recipes",
             $Vendor,
             $Product,
             $Version

$NewWorking = New-Item -ItemType Directory -Path $RecipeDir -Name "Working Files" -Force
Copy-Item -Path (Join-Path -Path $PSScriptRoot -Child *) -Exclude $MyInvocation.MyCommand.Name -Destination $NewWorking
Set-Location $NewWorking
