#Usage
#https://www.powershellgallery.com/packages/AutopilotNuke/2.3

#Install
if (!(Get-Command AutopilotNuke -ErrorAction Ignore)) {
    Install-Script AutopilotNuke -Force -Verbose
}

#Execute
& "$env:ProgramFiles\WindowsPowerShell\Scripts\AutopilotNuke.ps1"