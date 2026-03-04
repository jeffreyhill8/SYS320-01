function SendAlertEmail($Body){

$From = "jeffrey.hill@mymail.champlain.edu"
$To = "jeffrey.hill@mymail.champlain.edu"
$Subject = "Suspicious Activity"

$Password = Get-Content "C:\Users\champuser\SYS320-01\Week7\file.txt" | ConvertTo-SecureString
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SMTPServer "smtp.gmail.com" -port 587 -UseSsl -Credential $Credential
}

SendAlertEmail "Body of Email"