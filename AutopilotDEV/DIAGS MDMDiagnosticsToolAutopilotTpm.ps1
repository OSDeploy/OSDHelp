if (!(Test-Path 'C:\Temp')) {New-Item -Path 'C:\Temp' -ItemType Directory -Force}
Start-Process MDMDiagnosticsTool.exe -ArgumentList "-area Autopilot;TPM","-cab C:\Temp\MDMAutopilotTpm.cab"