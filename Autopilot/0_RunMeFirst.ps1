#================================================
#   Disable Console Line Wrap
#   If you plan on using EventWatch, your lines can get
#   very long. To keep things straight, turn off Line Wrap
#   with this Registry setting
#================================================
reg add HKCU\Console /v LineWrap /t REG_DWORD /d 0 /f

#================================================
#   Set-DisRes 1600 for Virtual Machine
#   If you are using Hyper-V, it may be helpful
#   to bump up your Display Resolution
#================================================
if ((Get-MyComputerModel) -match 'Virtual') {
    Write-Host  -ForegroundColor DarkCyan 'Set-DisRes 1600'
    Set-DisRes 1600
}

#================================================
#   Open URI Display Settings
#   If you are in OOBE, things can get crowded
#   Make sure your Display Scaling is set to 100%
#================================================
Start-Process ms-settings:display

#================================================
#   Open Default Browser
#   If you need to authenticate to a Firewall while
#   in OOBE then this will get things working
#================================================
start www.msn.com