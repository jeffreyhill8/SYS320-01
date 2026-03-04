$configPath = "C:\Users\champuser\SYS320-01\Week7\configuration.txt"

. "$PSScriptRoot\configurationFunctions.ps1"

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Show Configuration`n"
$Prompt += "2 - Change Configuration`n"
$Prompt += "3 - Exit`n"

do {
    $Choice = Read-Host $Prompt

    if ($Choice -eq "1") {
        ShowConfig
    }

    elseif ($Choice -eq "2") {
        ChangeConfig
    }
    
    elseif ($Choice -eq "3") {
        Write-Host "`nExiting`n"
    }
    else {
        Write-Host "`nInvalid Input, 1-3`n"
    }
} while ($Choice -ne "3")