#Requires -RunAsAdministrator

#How To: Update OSD Module and start OSDPad automatically
#OSDPad will load scripts from https://github.com/OSDeploy/OSDHelp/tree/main/OSDCloudDeploy

$Params = @{
    StartUpdate = $true
    StartOSDPad = "OSDeploy OSDHelp OSDCloudDeploy"
}
Edit-OSDCloud.winpe @Params