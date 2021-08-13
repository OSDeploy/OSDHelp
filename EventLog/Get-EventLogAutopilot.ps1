#Requires -RunAsAdministrator

#How To: Filter Event Log for Autopilot changes in the last day
$StartTime = (Get-Date).AddDays(- 1)
$Events = @()
$Events += Get-WinEvent -FilterHashtable @{StartTime = $StartTime; LogName = 'Microsoft-Windows-AAD/Operational'} -ErrorAction Ignore
#$Events += Get-WinEvent -FilterHashtable @{StartTime = $StartTime; LogName = 'Microsoft-Windows-AppXDeployment-Server/Operational'} -ErrorAction Ignore
$Events += Get-WinEvent -FilterHashtable @{StartTime = $StartTime; LogName = 'Microsoft-Windows-AssignedAccess/Admin'} -ErrorAction Ignore
$Events += Get-WinEvent -FilterHashtable @{StartTime = $StartTime; LogName = 'Microsoft-Windows-AssignedAccess/Operational'} -ErrorAction Ignore
$Events += Get-WinEvent -FilterHashtable @{StartTime = $StartTime; LogName = 'Microsoft-Windows-AssignedAccessBroker/Admin'} -ErrorAction Ignore
$Events += Get-WinEvent -FilterHashtable @{StartTime = $StartTime; LogName = 'Microsoft-Windows-AssignedAccessBroker/Operational'} -ErrorAction Ignore
$Events += Get-WinEvent -FilterHashtable @{StartTime = $StartTime; LogName = 'Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Admin'} -ErrorAction Ignore
$Events += Get-WinEvent -FilterHashtable @{StartTime = $StartTime; LogName = 'Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Operational'} -ErrorAction Ignore
$Events += Get-WinEvent -FilterHashtable @{StartTime = $StartTime; LogName = 'Microsoft-Windows-ModernDeployment-Diagnostics-Provider/Autopilot'} -ErrorAction Ignore
$Events += Get-WinEvent -FilterHashtable @{StartTime = $StartTime; LogName = 'Microsoft-Windows-ModernDeployment-Diagnostics-Provider/ManagementService'} -ErrorAction Ignore
$Events += Get-WinEvent -FilterHashtable @{StartTime = $StartTime; LogName = 'Microsoft-Windows-Provisioning-Diagnostics-Provider/Admin'} -ErrorAction Ignore
$Events += Get-WinEvent -FilterHashtable @{StartTime = $StartTime; LogName = 'Microsoft-Windows-Shell-Core/Operational'} -ErrorAction Ignore
$Events += Get-WinEvent -FilterHashtable @{StartTime = $StartTime; LogName = 'Microsoft-Windows-User Device Registration/Admin'} -ErrorAction Ignore

$Events | Sort-Object TimeCreated | Select-Object TimeCreated,LevelDisplayName,LogName,Id,Message,ProviderName | Out-GridView