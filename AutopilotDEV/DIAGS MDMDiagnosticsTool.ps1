if (!(Test-Path 'C:\Temp')) {New-Item -Path 'C:\Temp' -ItemType Directory -Force}
Start-Process MDMDiagnosticsTool.exe -ArgumentList '-out C:\Temp'