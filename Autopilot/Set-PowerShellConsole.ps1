#Increase the Screen Buffer
reg add "HKCU\Console\%SystemRoot%_SysWOW64_WindowsPowerShell_v1.0_powershell.exe" /v ScreenBufferSize /t REG_DWORD /d 196608120 /f