# OSDHelp Autopilot

- Show-DisplaySettings.ps1
If you are working in OOBE, I strongly recommend changing the
Display Scaling to 100%.  Use the following command:
start ms-settings:display

Register a device in Autopilot
- Invoke-AutopilotOOBE.ps1
- Invoke-Get-WindowsAutopilotInfo.ps1

Kill a device in Autopilot
- Invoke-AutopilotNuke.ps1

Autopilot Diagnostics
- Invoke-Get-AutopilotDiagnostics.ps1
- Invoke-Get-AutopilotDiagnosticsOnline.ps1
- Invoke-MDMDiagnosticsTool.ps1
- Invoke-MDMDiagnosticsToolAutopilot.ps1
- Invoke-MDMDiagnosticsToolAutopilotTpm.ps1

WinEvent Viewing
- WinEventGridView-Autopilot.ps1
- WinEventGridView-MDMDiagnostics.ps1
- WinEventGridView-TimeService.ps1

WinEvent Monitoring
- WinEventMonitor-Autopilot.ps1
- WinEventMonitor-MDMDiagnostics.ps1