$configPath = "C:\Users\champuser\SYS320-01\Week7\configuration.txt"

function ReadConfig {
    if(Test-Path $configPath){
        $lines = Get-Content $configPath
        return [PSCustomObject]@{
            Days          = $lines[0]
            ExecutionTime = $lines[1]
        }
    } else { 
        Write-Host "configuration file not found" -ForegroundColor Red
        return $null
    }
}

function ShowConfig {
    $config = ReadConfig
    if ($config) {
        $config | Format-Table
    }
}

function ChangeConfig {
    do {
        $days = Read-Host "Enter number of days for which the logs will be obtained (Digits only)"
        if ($days -notmatch '^\d+$') {
            Write-Host "Invalid input. Please enter digits only."
        }
    } while ($days -notmatch '^\d+$')

    do {
        $time = Read-Host "Enter the daily execution time (e.g. 1:12 PM)"
        if ($time -notmatch '^\d{1,2}:\d{2}\s*(AM|PM)$') {
            Write-Host "Invalid format"
        }
    } while ($time -notmatch '^\d{1,2}:\d{2}\s*(AM|PM)$')

    Set-Content -Path $configPath -Value @($days, $time)
    Write-Host "Configuration updated successfully."
}