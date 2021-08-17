#Requires -RunAsAdministrator
#================================================
#   Install and Import Module
#================================================
Install-Module AutopilotOOBE -Force
Import-Module AutopilotOOBE -Force
#================================================
#   Parameters
#   [[-CustomProfile] <string>]
#   [[-Disabled] {GroupTag | AddToGroup | AssignedUser | AssignedComputerName | PostAction | Assign}]
#   [[-Hidden] {GroupTag | AddToGroup | AssignedUser | AssignedComputerName | PostAction | Assign | Register | Run | Docs}]
#   [[-AddToGroup] <string>] [[-AddToGroupOptions] <string[]>] [[-AssignedUser] <string>] 
#   [[-AssignedUserExample] <string>]
#   [[-AssignedComputerName] <string>]
#   [[-AssignedComputerNameExample] <string>]
#   [[-GroupTag] <string>]
#   [[-GroupTagOptions] <string[]>]
#   [[-PostAction] {Quit | Restart | Shutdown | Sysprep | SysprepReboot | SysprepShutdown | GeneralizeReboot | GeneralizeShutdown}]
#   [[-Run] {CommandPrompt | PowerShell | PowerShellISE | WindowsExplorer | WindowsSettings | NetworkingWireless | Restart | 
#   Shutdown | Sysprep | SysprepReboot | SysprepShutdown | SysprepAudit | EventViewer | GetAutopilotDiagnostics | 
#   GetAutopilotDiagnosticsOnline | MDMDiag | MDMDiagAutopilot | MDMDiagAutopilotTPM}]
#   [[-Docs] <string>]
#   [[-Title] <string>] [-Assign]
#================================================
Start-AutopilotOOBE