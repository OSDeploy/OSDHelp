#Requires -RunAsAdministrator

#How To: Set Firewall logging for all profiles
#This is useful in Autopilot for detecting Ports that may be needed
#For TPM Attestation

$Params = @{
    Name = "*"
    LogAllowed = 'True'
    LogBlocked = 'True'
    LogIgnored = 'True'
    LogMaxSizeKilobytes = 16000
}
Get-NetFirewallProfile
Set-NetFirewallProfile @Params
Get-NetFirewallProfile