#Requires -RunAsAdministrator

#How To: Quick Setup of OSDCloud
#WiFi: Enabled
#Drivers: Dell, VMware, and WiFi
#Startup: OSDCloudGUI

Install-Module OSD -Force
Import-Module OSD -Force
New-OSDCloudTemplate -WinRE
New-OSDCloudWorkspace -WorkspacePath C:\OSDCloud

$Params = @{
    CloudDriver = 'Dell','VMware','WiFi'
    StartOSDCloudGUI = $true
}
Edit-OSDCloudWinPE @Params
New-OSDCloudISO