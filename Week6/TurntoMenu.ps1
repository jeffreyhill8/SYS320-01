. (Join-Path "C:\Users\champuser\SYS320-01\Week4" "ApacheLogs1.ps1")
. (Join-Path "C:\Users\champuser\SYS320-01\Week6" "Event-Logs.ps1")
. (Join-Path "C:\Users\champuser\SYS320-01\week2" "ProcessManagementAltogether.ps1")

$Prompt = "`n"
$Prompt += "Choose your option:`n"
$Prompt += "1 - Display last 10 Apache logs:`n"
$Prompt += "2 - Display last 10 failed logins for all users:`n"
$Prompt += "3 - Display at risk users:`n"
$Prompt += "4 - Start Chrome and navigate to champlain.edu:`n"
$Prompt += "5 - Exit`n"

do {
    $Choice = Read-Host $Prompt

    if ($Choice -eq "1") {
        ApacheLogs1 | Select-Object -Last 10 | Format-Table -AutoSize
    }
    elseif ($Choice -eq "2") {
        getFailedLogins 90 | Select-Object -Last 10 | Format-Table -AutoSize
    }
    elseif ($Choice -eq "3") {
        $days = Read-Host "Enter number of days to check"
        $userLogins = getFailedLogins $days

        $atRisk = $userLogins | Group-Object -Propterty User | Where-Object { $_.Count -gt 10 } | Select-Object Name, Count

        Write-Host "Users with more than 10 failed logins in the last $days days:"
        Write-Host ($atRisk | Format-Table | Out-String)
    }
    elseif ($Choice -eq "4") {
        StartChrome
    }
    elseif ($Choice -eq "5") {
        Write-Host "`nExiting`n"
    }
    else {
        Write-Host "`nInvalid Input, 1-5`n"
    }
} while ($Choice -ne "5")