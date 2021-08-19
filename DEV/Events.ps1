$evtxfiles = Get-ChildItem -Path C:\Temp *.evtx
$events = @()
foreach ($Item in $evtxfiles) {
   $events += Get-Winevent -Path $Item.FullName -ErrorAction SilentlyContinue
}
$events = $events | Sort-Object TimeCreated
$events = $events | Group-Object Id | ForEach-Object {$_.Group | Select-Object -Last 1}
$events | Sort-Object TimeCreated | OGV