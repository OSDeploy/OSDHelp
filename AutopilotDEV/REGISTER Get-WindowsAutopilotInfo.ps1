#Usage
#https://www.powershellgallery.com/packages/Get-WindowsAutoPilotInfo/3.5
#C:\Program Files\WindowsPowerShell\Scripts\Get-WindowsAutoPilotInfo.ps1 [[-Name] 
#<String[]>] [-OutputFile <String>] [-GroupTag <String>] [-AssignedUser <String>] 
#[-Append] [-Credential <PSCredential>] [-Partner] [-Force] [<CommonParameters>]

#C:\Program Files\WindowsPowerShell\Scripts\Get-WindowsAutoPilotInfo.ps1 [[-Name] 
#<String[]>] [-OutputFile <String>] [-GroupTag <String>] [-AssignedUser <String>] 
#[-Append] [-Credential <PSCredential>] [-Partner] [-Force] -Online [-TenantId 
#<String>] [-AppId <String>] [-AppSecret <String>] [-AddToGroup <String>] 
#[-AssignedComputerName <String>] [-Assign] [-Reboot] [<CommonParameters>]

#Install
if (!(Get-Command Get-WindowsAutoPilotInfo -ErrorAction Ignore)) {
    Install-Script Get-WindowsAutoPilotInfo -Force -Verbose
}

#Execute
& "$env:ProgramFiles\WindowsPowerShell\Scripts\Get-WindowsAutoPilotInfo.ps1"