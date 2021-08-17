#Requires -RunAsAdministrator
#================================================
#   Initialize
#================================================
$Title = 'WinEventGridView-TimeService'
$host.ui.RawUI.WindowTitle = $Title
#================================================
#   Main Variables
#================================================
$FormatEnumerationLimit = -1
# This will go back 5 days in the logs.  Adjust as needed
$StartTime = (Get-Date).AddDays(- 5)
$ExcludeEventId = @(200,202,260,263,266,272)
#================================================
#   LogName
#   These are the WinEvent logs to monitor
#================================================
$LogName = @(
    #'Microsoft-Windows-AAD/Operational'
    #'Microsoft-Windows-AppXDeploymentServer/Operational'
    #'Microsoft-Windows-AssignedAccess/Admin'
    #'Microsoft-Windows-AssignedAccess/Operational'
    #'Microsoft-Windows-AssignedAccessBroker/Admin'
    #'Microsoft-Windows-AssignedAccessBroker/Operational'
    #'Microsoft-Windows-Crypto-NCrypt/Operational'
    #'Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Admin'
    #'Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Debug'
    #'Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Operational'
    #'Microsoft-Windows-ModernDeployment-Diagnostics-Provider/Autopilot'
    #'Microsoft-Windows-ModernDeployment-Diagnostics-Provider/ManagementService'
    #'Microsoft-Windows-Provisioning-Diagnostics-Provider/Admin'
    #'Microsoft-Windows-Shell-Core/Operational'
    'Microsoft-Windows-Time-Service/Operational'
    #'Microsoft-Windows-User Device Registration/Admin'
)
#================================================
#   FilterHashtable
#================================================
$FilterHashtable = @{
    StartTime = $StartTime
    LogName = $LogName
}
#================================================
#   Get-WinEvent Results
#================================================
$Results = Get-WinEvent -FilterHashtable $FilterHashtable -ErrorAction Ignore
$Results = $Results | Sort-Object TimeCreated | Where-Object {$_.Id -notin $ExcludeEventId}
$Results | Select-Object TimeCreated,LevelDisplayName,LogName,Id,Message | Out-GridView