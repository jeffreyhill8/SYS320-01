Write-Host "===== Processes Starting with 'C' =====" #Header for task 1
Get-Process | Where-Object { $_.ProcessName -ilike "C*" } #Get-Process gets all running processes and Where-Object Filters the results 

Write-Host "===== Processes not in system 32 =====" #Header for task 2
Get-Process | Where-Object { $_.Path -notlike "*system32*" } #Get-Process gets all running processes and Where-Object Filters to only show processes not connected to System32

Write-Host "===== Every Stopped Service =====" #Header for task 3 
Get-service | Where-Object { $_.Status -eq 'Stopped' } | Sort-Object -Property Name | Export-Csv -Path "Task#3.csv" -NoTypeInformation #Get-Service Gets all services on the system, Where-Object filters these services to only show stopped ones, Sort-Object sorts the services alphabeticaly, and Export-csv saves the output to a CSV file. 

Write-Host "===== Creates Google Chrome Instance Running Champlain.edu =====" #Header for task 4 
$chromeProcess = Get-Process -Name "chrome" -ErrorAction SilentlyContinue #Checks if chrome is already running or not
if ($null -eq $chromeProcess) {
    Start-Process "chrome" "https://champlain.edu"
} # if Chrome is not running it runs chrome and directs the page to champlain.edu
else {
    Stop-Process -Name "chrome" -Force
} # If chrome is already running it closes out of chrome 