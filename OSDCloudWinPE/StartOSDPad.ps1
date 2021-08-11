#Requires -RunAsAdministrator

#How To: WinPE startup to OSDPad
#OSDPad will load scripts from https://github.com/OSDeploy/OSDHelp/tree/main/OSDCloudDeploy

Edit-OSDCloud.winpe -StartOSDPad 'OSDeploy OSDHelp OSDCloudDeploy'