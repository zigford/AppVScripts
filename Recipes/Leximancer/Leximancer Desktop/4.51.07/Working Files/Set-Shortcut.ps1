Param($ShortcutPath,$TargetPath,$IconPath)

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$ShortcutPath")
$Shortcut.TargetPath = "$TargetPath"
$Shortcut.IconLocation = "$IconPath"
$Shortcut.Save()
