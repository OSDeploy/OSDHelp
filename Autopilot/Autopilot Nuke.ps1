#https://www.powershellgallery.com/packages/AutopilotNuke/2.3

if (!(Get-Command AutopilotNuke)) {
    Install-Script AutopilotNuke -Force -Verbose
}

& 'C:\Program Files\WindowsPowerShell\Scripts\AutopilotNuke.ps1'