#Requires -RunAsAdministrator

#How To: The basics of Edit-OSDCloud.winpe
#This is a good recommendation for creating your first WinPE
#Make sure the Wallpaper file is a JPG
#Make sure the Wallpaper in the right path

$Params = @{
    CloudDriver = 'Dell','VMware','WiFi'
    StartOSDCloudGUI = $true
    Wallpaper = "$env:ProgramData\OSDCloud\Resources\Wallpaper\Wallpaper.jpg"
}
Edit-OSDCloudWinPE @Params
New-OSDCloudISO