#Requires -RunAsAdministrator

#How To: Filter Event Log for Time-Service changes in the last day
$StartTime = (Get-Date).AddDays(- 1)
$Events = @()
$Events = Get-WinEvent -FilterHashtable @{
    LogName = 'Microsoft-Windows-Time-Service/Operational'
    StartTime = $StartTime
}
$Events | Sort-Object TimeCreated | Select-Object TimeCreated,LevelDisplayName,LogName,Id,Message,ProviderName | Out-GridView