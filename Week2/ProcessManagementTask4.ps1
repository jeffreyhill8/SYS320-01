Write-Host "===== Creates Google Chrome Instance Running Champlain.edu =====" #Header for task 4 
$chromeProcess = Get-Process -Name "chrome" -ErrorAction SilentlyContinue #Checks if chrome is already running or not
if ($null -eq $chromeProcess) {
    Start-Process "chrome" "https://champlain.edu"
} # if Chrome is not running it runs chrome and directs the page to champlain.edu
else {
    Stop-Process -Name "chrome" -Force
} # If chrome is already running it closes out of chrome 