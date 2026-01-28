function Get-StartupShutdownLogs {
    param ([int]$Days)
    $startupshutdowns = Get-EventLog System -After (Get-Date).AddDays(-$Days) 

    $startupshutdownTable = @()
    for($i=0; $i -lt $startupshutdowns.Count; $i++){

    $event= ""
    if($startupshutdowns[$i].EventId -eq 6005) {$event="Startup"}
    if($startupshutdowns[$i].EventId -eq 6006) {$event="Shutdown"}

    if($event -ne "") {
        $startupshutdownTable += [pscustomobject]@{"Time" = $startupshutdowns[$i].TimeGenerated;
                                                     "id" = $startupshutdowns[$i].EventId;
                                                  "Event" = $event;
                                                   "User" =  "System";
            }
        }
    }
    $startupshutdownTable
}
Get-StartupShutdownLogs 900