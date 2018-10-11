# TechSmith Camtasia Studio 2018 18.0.4.3822

Script files to create production package of Camtasia Studio.

Author: Jesse Harris

## Discovery Notes

Uses a custom installer which accepts -s param to accept the defaults and install silently.
Configuration can be customized post install by tweaking registry settings.

### Install Dir

C:\Program Files\TechSmith\Camtasia 2018\

### Registry Paths

* HKCU\Software\TechSmith\Camtasia Studio\18.0\Camtasia Studio\18.0
* HKLM\Software\TechSmith\Camtasia Studio\18.0

### HKCU Registy Values

|Value               |Effect                     |
|--------------------|---------------------------|
|AllowDateBasedCheck |0 = Disable Auto Updates   |
|ShowWelcomeWindows  |0 = Disable Welcome screen |
