#Requires -RunAsAdministrator

#How To: Quick Setup of OSDCloud
#WiFi: Enabled
#Drivers: Dell, VMware, and WiFi
#Startup: OSDCloudGUI

Install-Module OSD -Force
Import-Module OSD -Force
New-OSDCloud.template -WinRE
New-OSDCloud.workspace -WorkspacePath C:\OSDCloud

$Params = @{
    CloudDriver = 'Dell','VMware','WiFi'
    StartOSDCloudGUI = $true
}
Edit-OSDCloud.winpe @Params
New-OSDCloud.iso