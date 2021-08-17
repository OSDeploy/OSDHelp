#Requires -RunAsAdministrator
#================================================
#   Initialize
#================================================
$Title = 'Diagnostic_MDMDiagnosticsToolAutopilot'
$host.ui.RawUI.WindowTitle = $Title
$host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.size(2000,2000)
#================================================
#   Temp
#================================================
if (!(Test-Path "$env:SystemDrive\Temp")) {
    New-Item -Path "$env:SystemDrive\Temp" -ItemType Directory -Force
}
#================================================
#   Run
#================================================
Start-Process MDMDiagnosticsTool.exe -ArgumentList "-area Autopilot","-cab $env:SystemDrive\MDMAutopilot.cab"