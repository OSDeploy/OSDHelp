$Params = @{
    AddNetFX3 = $true
    AddRSAT = $true
    RemoveAppx = "CommunicationsApps","OfficeHub","People","Skype","Solitaire","Xbox","ZuneMusic","ZuneVideo"
    SetEdition = 'Enterprise'
    UpdateDrivers = $true
    UpdateWindows = $true
}
Start-OOBEDeploy @Params