#================================================
#   Initialize
#================================================
$Title = 'WinEventMonitor-Autopilot'
$host.ui.RawUI.WindowTitle = $Title
$Transcript = "$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-$Title.log"
Start-Transcript -Path (Join-Path "$env:SystemRoot\Temp" $Transcript) -ErrorAction Ignore
#================================================
#   Main Variables
#================================================
$Monitor = $true
$Results = @()
$FormatEnumerationLimit = -1
# This will go back 5 days in the logs.  Adjust as needed
$StartTime = (Get-Date).AddDays(- 5)
$ExcludeEventId = @(200,202,260,263,272)
#================================================
#   LogName
#   These are the WinEvent logs to monitor
#================================================
$LogName = @(
    'Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Admin'
    'Microsoft-Windows-Time-Service/Operational'
)
#Requires -RunAsAdministrator
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
$StartTime = [DateTime]::Now.DateTim
$Results = $Results | Sort-Object TimeCreated | Where-Object {$_.Id -notin $ExcludeEventId}
$Results = $Results | Select-Object TimeCreated, ProviderName, Id, LevelDisplayName, @{Name='Message';Expression={ ($_.Message -Split '\n')[0]}}
#================================================
#   Display Results
#================================================
foreach ($Item in $Results) {
    if ($Item.LevelDisplayName -eq 'Error') {
        Write-Host "$($Item.TimeCreated) $($Item.LevelDisplayName) $($Item.Id) $($Item.Message)" -ForegroundColor Red
    }
    elseif ($Item.LevelDisplayName -eq 'Warning') {
        Write-Host "$($Item.TimeCreated) $($Item.LevelDisplayName) $($Item.Id) $($Item.Message)" -ForegroundColor Yellow
        
    }
    else {
        Write-Host "$($Item.TimeCreated) $($Item.LevelDisplayName) $($Item.Id) $($Item.Message)"
    }
}
#================================================
#   Monitor New Events
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
        #   Get-WinEvent Results
        #================================================
        $Results = Get-WinEvent -FilterHashtable $FilterHashtable -ErrorAction Ignore
        $StartTime = [DateTime]::Now.DateTim
        $Results = $Results | Sort-Object TimeCreated | Where-Object {$_.Id -notin $ExcludeEventId}
        $Results = $Results | Select-Object TimeCreated, ProviderName, Id, LevelDisplayName, @{Name='Message';Expression={ ($_.Message -Split '\n')[0]}}
        #================================================
        #   Display Results
        #================================================
        foreach ($Item in $Results) {
            if ($Item.LevelDisplayName -eq 'Error') {
                Write-Host "$($Item.TimeCreated) $($Item.LevelDisplayName) $($Item.Id) $($Item.Message)" -ForegroundColor Red
            }
            elseif ($Item.LevelDisplayName -eq 'Warning') {
                Write-Host "$($Item.TimeCreated) $($Item.LevelDisplayName) $($Item.Id) $($Item.Message)" -ForegroundColor Yellow
                
            }
            else {
                Write-Host "$($Item.TimeCreated) $($Item.LevelDisplayName) $($Item.Id) $($Item.Message)"
            }
        }
    }
}