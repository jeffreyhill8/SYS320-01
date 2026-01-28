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
Get-LoginLogoffLogs -Days 15
