#Requires -RunAsAdministrator

#How To: Adds one or more lines to Startnet.cmd

$Startnet = @'
cls
start PowerShell -NoL -C OSDPad -RepoOwner OSDeploy -RepoName OSDHelp -RepoFolder OSDCloudDeploy
'@

Edit-OSDCloudWinPE -Startnet $Startnet