[CmdLetBinding()]
Param($Command)

$Bytes = [System.Text.Encoding]::Unicode.GetBytes($Command)
return [Convert]::ToBase64String($Bytes)
