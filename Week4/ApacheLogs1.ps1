function ApacheLogs1 {
  $logsNotFormatted = Get-Content "C:\xampp\apache\logs\access.log"
  $tableRecords = @()

  foreach($line in $logsNotFormatted){
    $section = $line -split ' '

    $obtain = [PSCustomObject]@{
      IP = $section[0]
      Time = $section[3] + " " + $section[4]
      Method = $section[5].Trim('"')
      Page = $section[6]
      Protocol = $section[7].Trim('"')
      Response = $section[8]
      Referrer = $section[10]
    }

    $tableRecords += $obtain
  }

  return $tableRecords
}