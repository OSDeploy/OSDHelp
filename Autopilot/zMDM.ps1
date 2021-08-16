#================================================
#   Initialize
#================================================
$host.ui.RawUI.WindowTitle = 'MDM Event Monitor'
$Monitor = $true
$Results = @()
$StartTime = (Get-Date).AddDays(- 2)
$FormatEnumerationLimit = -1
#================================================
#   LogName
#================================================
$LogName = @(
    'Microsoft-Windows-AAD/Operational'
    'Microsoft-Windows-AssignedAccess/Admin'
    'Microsoft-Windows-AssignedAccess/Operational'
    'Microsoft-Windows-AssignedAccessBroker/Admin'
    'Microsoft-Windows-AssignedAccessBroker/Operational'
    'Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Admin'
    'Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Operational'
    'Microsoft-Windows-ModernDeployment-Diagnostics-Provider/Autopilot'
    'Microsoft-Windows-ModernDeployment-Diagnostics-Provider/ManagementService'
    'Microsoft-Windows-Provisioning-Diagnostics-Provider/Admin'
    'Microsoft-Windows-Shell-Core/Operational'
    'Microsoft-Windows-Time-Service/Operational'
    'Microsoft-Windows-User Device Registration/Admin'
)
#================================================
#   FilterHashtable
#================================================
$FilterHashtable = @{
    StartTime = $StartTime
    LogName = $LogName
}
#================================================
#   Get-WinEvent
#================================================
$Results = Get-WinEvent -FilterHashtable $FilterHashtable -ErrorAction Ignore
#================================================
#   Results
#================================================
$StartTime = [DateTime]::Now.DateTime #Reset Start Time
$Results = $Results | Sort-Object TimeCreated #Sort Events
$Results = $Results | Select-Object TimeCreated, ProviderName, Id, LevelDisplayName, @{Name='Message';Expression={ ($_.Message -Split '\n')[0] }}
#Write-Output $Results | Format-Table -HideTableHeaders

foreach ($Item in $Results) {
    Write-Output "$($Item.TimeCreated) $($Item.Id) $($Item.Message)"
}
#================================================
#   Monitor
#================================================
if ($Monitor) {
    Write-Host -ForegroundColor Cyan "Listening ..."
    while ($true) {
        Start-Sleep -Seconds 1 | Out-Null
        #================================================
        #   FilterHashtable
        #================================================
        $FilterHashtable = @{
            StartTime = $StartTime
            LogName = $LogName
        }
        #================================================
        #   Get-WinEvent
        #================================================
        $Results = Get-WinEvent -FilterHashtable $FilterHashtable -ErrorAction Ignore
        #================================================
        #   Results
        #================================================
        $StartTime = [DateTime]::Now.DateTime #Reset Start Time
        $Results = $Results | Sort-Object TimeCreated #Sort Events
        $Results = $Results | Select-Object TimeCreated, ProviderName, Id, LevelDisplayName, @{Name='Message';Expression={ ($_.Message -Split '\n')[0] }}
        #Write-Output $Results | Format-Table -HideTableHeaders
        foreach ($Item in $Results) {
            Write-Output "$($Item.TimeCreated) $($Item.Id) $($Item.Message)"
        }
    }
}