$UnknownDevices = Get-WmiObject -Class Win32_PNPEntity | Where-Object {$_.ConfigManagerErrorCode -eq '28'} | Sort-Object Name, DeviceID -Unique

$Random = Get-Random

foreach ($Item in $UnknownDevices) {
    Write-Host -ForegroundColor Magenta "$($Item.DeviceID)"
    Save-MsUpCatDriver -HardwareID $Item.DeviceID -DestinationDirectory "$env:Temp\Drivers\$Random"
}

if (Test-Path "$env:Temp\Drivers\$Random") {
    Explorer "$env:Temp\Drivers\$Random"
}