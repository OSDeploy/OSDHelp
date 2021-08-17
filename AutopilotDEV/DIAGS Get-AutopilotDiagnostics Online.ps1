# Usage
# [[-CABFile] <String>] [[-ZIPFile] <String>] [-Online] [-AllSessions] [-ShowPolicies]

# Install
if (!(Get-Command Get-AutopilotDiagnostics -ErrorAction Ignore)) {
    Install-Script Get-AutopilotDiagnostics -Force -Verbose
}

# ExecuteOnline
& "$env:ProgramFiles\WindowsPowerShell\Scripts\Get-AutopilotDiagnostics.ps1" -Online