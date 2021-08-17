#Requires -RunAsAdministrator
#================================================
#   Initialize
#================================================
$Title = 'Diagnostic_Get-AutopilotDiagnostics Online'
$host.ui.RawUI.WindowTitle = $Title
$host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.size(2000,2000)
#================================================
#   Temp
#================================================
if (!(Test-Path "$env:SystemDrive\Temp")) {
    New-Item -Path "$env:SystemDrive\Temp" -ItemType Directory -Force
}
#================================================
#   Transcript
#================================================
$Transcript = "$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-$Title.log"
Start-Transcript -Path (Join-Path "$env:SystemDrive\Temp" $Transcript) -ErrorAction Ignore
#================================================
#   Install Script
#================================================
if (!(Get-Command Get-AutopilotDiagnostics -ErrorAction Ignore)) {
    Install-Script Get-AutopilotDiagnostics -Force -Verbose
}
#================================================
#   Run
#   [[-CABFile] <String>] [[-ZIPFile] <String>] [-Online] [-AllSessions] [-ShowPolicies]
#================================================
& "$env:ProgramFiles\WindowsPowerShell\Scripts\Get-AutopilotDiagnostics.ps1" -Online