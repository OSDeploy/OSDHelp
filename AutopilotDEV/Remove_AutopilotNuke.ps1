#Requires -RunAsAdministrator
#================================================
#   Install Script
#================================================
if (!(Get-Command AutopilotNuke -ErrorAction Ignore)) {
    Install-Script AutopilotNuke -Force -Verbose
}
#================================================
#   Run
#================================================
& "$env:ProgramFiles\WindowsPowerShell\Scripts\AutopilotNuke.ps1"