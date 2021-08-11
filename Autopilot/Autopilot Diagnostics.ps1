#C:\Program Files\WindowsPowerShell\Scripts\Get-AutopilotDiagnostics.ps1 [[-CABFile] <String>] [[-ZIPFile] <String>] [-Online] [-AllSessions] [-ShowPolicies]

if (!(Get-Command Get-AutopilotDiagnostics)) {
    Install-Script Get-AutopilotDiagnostics -Force -Verbose
}

Get-AutopilotDiagnostics.ps1