#Requires -RunAsAdministrator

#How To: Set Firewall logging back to defaults

$Params = @{
    Name = "*"
    LogAllowed = 'NotConfigured'
    LogBlocked = 'NotConfigured'
    LogIgnored = 'NotConfigured'
    LogMaxSizeKilobytes = 4096
}
Get-NetFirewallProfile
Set-NetFirewallProfile @Params
Get-NetFirewallProfile