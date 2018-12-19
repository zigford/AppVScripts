# Extract all Visual Studio runtime (Visual Studio Shell 2015 (Isolated)) 
# elements from a SSMS Installation
# 2017' Andreas Nick
 
 
# fist: install SSMS 17.2!
 
if(-NOT (Test-path 'C:\ProgramData\Package Cache\FE948F0DAB52EB8CB5A740A77D8934B9E1A8E301\redist\vs_isoshell.exe'  )) {
     
    Write-Verbose "install SSMS 17.2!" -Verbose
 
} 
 
if( -not (test-path "$PSScriptRoot\SSMSRuntime")) {
    New-Item "$PSScriptRoot\SSMSRuntime" -ItemType directory | out-null
 
}
 
Write-Host "Extract all Visual Studio runtime (Visual Studio Shell 2015)" -ForegroundColor Cyan
Write-Host "Copy vs_isoshell.exe" -ForegroundColor Yellow
Copy-Item 'C:\ProgramData\Package Cache\FE948F0DAB52EB8CB5A740A77D8934B9E1A8E301\redist\vs_isoshell.exe' -Destination "$PSScriptRoot\SSMSRuntime\" -Force
Write-Host "Copy VS14-KB3095681.exe" -ForegroundColor Yellow
Copy-Item 'C:\ProgramData\Package Cache\02A26E554FBB4232ACD36E70D09F2C7893D399CD\redist\VS14-KB3095681.exe' -Destination "$PSScriptRoot\SSMSRuntime\" -Force
Write-Host "Copy vsta_setup.exe" -ForegroundColor Yellow
Copy-Item 'C:\ProgramData\Package Cache\5E6157D16EC044A823B2FD2C030ED6DECD2E997E\redist\vsta_setup.exe' -Destination "$PSScriptRoot\SSMSRuntime\" -Force
Write-Host "Copy vsta_ls.ex" -ForegroundColor Yellow
Copy-Item 'C:\ProgramData\Package Cache\4F812BBB2BE7E30CED293F8A229A5410D70DE6DB\redist\vsta_ls.exe' -Destination "$PSScriptRoot\SSMSRuntime\" -Force
 
Write-Host "Finish (wait 5 seconds)" -ForegroundColor Cyan
 
Start-Sleep -Seconds 5
