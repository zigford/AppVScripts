REM Disable automatic upgrade check
reg.exe ADD "HKCU\Software\TechSmith\Camtasia Studio\18.0\Camtasia Studio\18.0" /v AllowDateBasedCheck /t REG_DWORD /d 0

REM Disable welcome windows
reg.exe ADD "HKCU\Software\TechSmith\Camtasia Studio\18.0\Camtasia Studio\18.0" /v ShowWelcomeWindows /t REG_DWORD /d 0