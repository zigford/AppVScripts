# RecFind 6 DRM 2.9
Script files to create production package of RecFind DRM.

Author: Jesse Harris

## Discovery Notes
Uses installsheild setup exe which can be silenced using the standard /S /v/qn params.
Environment can be customized after installation by replacing DRM.exe.config manifest file in installdir

### Install Dir
C:\Program Files (x86)\RecFind 6\DRM\

### Config File
DRM.exe.config placed in the InstallDir set's the connecting environment.

### Silent Switches

|Param                                |Effect                                              |
|-------------------------------------|----------------------------------------------------|
|/S                                   |Silence Installsheild dialogs                       |
|/v                                   |Pass params to embedded MSI                         |
|/qb                                  |params passed to MSI for unattended installation    |
|CM_SERVERNAME=\"recfind.usc.edu.au\" |params passed to MSI to set server." must be escaped|
|CM_SYSTEMNAME=\"RecFind\""           |params passed to MSI to set eviron." must be escaped|
