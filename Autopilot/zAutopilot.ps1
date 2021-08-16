#================================================
#   Initialize
#================================================
$host.ui.RawUI.WindowTitle = 'Autopilot Event Monitor'
$Monitor = $true
$Results = @()
$StartTime = (Get-Date).AddDays(- 2)
$FormatEnumerationLimit = -1
#================================================
#   LogName
#================================================
$LogName = @(
    'Microsoft-Windows-DeviceManagement-Enterprise-Diagnostics-Provider/Admin'
    'Microsoft-Windows-Time-Service/Operational'
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
    if ($Item.LevelDisplayName -eq 'Error') {
        Write-Host "$($Item.TimeCreated) $($Item.Id) $($Item.Message)" -ForegroundColor Red
    }
    elseif ($Item.LevelDisplayName -eq 'Warning') {
        Write-Host "$($Item.TimeCreated) $($Item.Id) $($Item.Message)" -ForegroundColor Yellow
        
    }
    else {
        Write-Host "$($Item.TimeCreated) $($Item.Id) $($Item.Message)"
    }
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
            if ($Item.LevelDisplayName -eq 'Error') {
                Write-Host "$($Item.TimeCreated) $($Item.Id) $($Item.Message)" -ForegroundColor Red
            }
            elseif ($Item.LevelDisplayName -eq 'Warning') {
                Write-Host "$($Item.TimeCreated) $($Item.Id) $($Item.Message)" -ForegroundColor Yellow
                
            }
            else {
                Write-Host "$($Item.TimeCreated) $($Item.Id) $($Item.Message)"
            }
        }
    }
}