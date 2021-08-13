#Requires -RunAsAdministrator

#How To: Open URI Windows Security
Start-Process PowerShell.exe -ArgumentList "Add-AppxPackage -Register -DisableDevelopmentMode 'C:\Windows\SystemApps\Microsoft.Windows.SecHealthUI_cw5n1h2txyewy\AppXManifest.xml';start windowsdefender:"