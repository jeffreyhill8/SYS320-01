function Get-LoginLogoffLogs {
    param([int]$Days)
    $loginouts = Get-EventLog System -source Microsoft-Windows-WinLogon -After (Get-Date).AddDays(-$Days)

    $loginoutsTable = @()
    for($i=0; $i -lt $loginouts.Count; $i++){

    $event= ""
    if($loginouts[$i].InstanceId -eq 7001) {$event="Logon"}
    if($loginouts[$i].InstanceId -eq 7002) {$event="Logoff"}

    $user = $loginouts[$i].ReplacementStrings[1]

        $sid = New-Object System.Security.Principal.SecurityIdentifier($user)
        $user = $sid.Translate([System.Security.Principal.NTAccount]).Value

    $loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated;
                                           "id" = $loginouts[$i].InstanceId;
                                        "Event" = $event;
                                         "User" = $user;
                                         }
    }
    return $loginoutsTable
}
function Get-StartupLogs {
    param ([int]$Days)
    $startup = Get-EventLog System -After (Get-Date).AddDays(-$Days) 

    $startupTable = @()
    for($i=0; $i -lt $startup.Count; $i++){

    $event= ""
    if($startup[$i].EventId -eq 6005) {$event="Startup"}

    if($event -ne "") {
        $startupTable += [pscustomobject]@{"Time" = $startup[$i].TimeGenerated;
                                                     "id" = $startup[$i].EventId;
                                                  "Event" = $event;
                                                   "User" =  "System";
            }
        }
    }
    $startupTable
}
function Get-ShutdownLogs {
    param ([int]$Days)
    $shutdowns = Get-EventLog System -After (Get-Date).AddDays(-$Days) 

    $shutdownTable = @()
    for($i=0; $i -lt $shutdowns.Count; $i++){

    $event= ""
    if($shutdowns[$i].EventId -eq 6006) {$event="Shutdown"}

    if($event -ne "") {
        $shutdownTable += [pscustomobject]@{"Time" = $shutdowns[$i].TimeGenerated;
                                                     "id" = $shutdowns[$i].EventId;
                                                  "Event" = $event;
                                                   "User" =  "System";
            }
        }
    }
    $shutdownTable
}
Get-LoginLogoffLogs -Days 900
Get-ShutdownLogs -Days 900
Get-StartupLogs -Days 900