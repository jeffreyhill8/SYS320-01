. .\ApacheLogs1.ps1

$tableRecords = ApacheLogs1
$tableRecords | Where-Object{ 
    ($_.Page -like "*page2.html*") -and ($_.Referrer -like "*index.html*")
} | Format-Table -AutoSize