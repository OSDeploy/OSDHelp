if (!(Test-Path 'C:\Temp')) {New-Item -Path 'C:\Temp' -ItemType Directory -Force}
Start-Process MDMDiagnosticsTool.exe -ArgumentList "-area Autopilot","-cab C:\Temp\MDMAutopilot.cab"