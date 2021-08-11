#Requires -RunAsAdministrator

#How To: Create an OSDCloud WinPE

Import-Module OSD -Force

$Params = @{
    CloudDriver = 'Dell','VMware','WiFi'
    StartOSDCloudGUI = $true
}
Edit-OSDCloud.winpe @Params