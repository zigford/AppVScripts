function Set-AppvXML{
[CmdletBinding()]
Param($Path,
    [ValidateSet(
        "User",
        "Machine",
        "All"
    )]$Target,
    [switch]$DisableObjects,
    [switch]$StripComments
)

    $Filter = Switch ($Target) {
        User {'*UserConfig.xml'}
        Machine {'*DeploymentConfig.xml'}
        Default {'*Config.xml'}
    }

    #Find XML
    Get-ChildItem -Path $Path -Filter $Filter | ForEach-Object {
        $XML = [xml](Get-Content $_.FullName -Raw)
        If ($XML.DeploymentConfiguration) {
            $WorkingXML = $XML.DeploymentConfiguration
        } else {
            $WorkingXML = $XML
        }
        If ($DisableObjects) {
            $WorkingXML.UserConfiguration.Subsystems.Objects.Enabled = 'false'
        }
        If ($StripComments) {
            $Comments = $XML.SelectNodes("//comments()")
            $Comments | ForEach-Object {$_.ParentNode.RemoveChild($_)}
        }
        $XML.Save($_.FullName)
    }
}