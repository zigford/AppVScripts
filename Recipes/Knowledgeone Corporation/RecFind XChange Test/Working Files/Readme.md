# RecFind 6 Xchange 2.9
Script files to create production package of RecFind Xchange.

Author: Jesse Harris

## Discovery Notes
Uses installsheild setup exe which can be silenced using the standard /S /v/qn params.
Environment can be customized after installation by replacing Xchange.exe.config manifest file in installdir

### Install Dir
C:\Program Files (x86)\RecFind 6\Xchange\

### Config File
Xchange.exe.config placed in the InstallDir set's the connecting environment.

### Silent Switches

|Param |Effect                                              |
|------|----------------------------------------------------|
|/S    |Silence Installsheild dialogs                       |
|/v    |Pass params to embedded MSI                         |
|/qb   |parameters passed to MSI for unattended installation|
