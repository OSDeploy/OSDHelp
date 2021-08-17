#Requires -RunAsAdministrator
#================================================
#   Install Script
#================================================
if (!(Get-Command Get-WindowsAutoPilotInfo -ErrorAction Ignore)) {
    Install-Script Get-WindowsAutoPilotInfo -Force -Verbose
}
#================================================
#   Parameters
#   [[-Name] <String[]>]
#   [-OutputFile <String>]
#   [-GroupTag <String>]
#   [-AssignedUser <String>] 
#   [-Append]
#   [-Credential <PSCredential>]
#   [-Partner]
#   [-Force]
#   -Online
#   [-TenantId <String>]
#   [-AppId <String>]
#   [-AppSecret <String>]
#   [-AddToGroup <String>] 
#   [-AssignedComputerName <String>]
#   [-Assign]
#   [-Reboot]
#================================================
& "$env:ProgramFiles\WindowsPowerShell\Scripts\Get-WindowsAutoPilotInfo.ps1"