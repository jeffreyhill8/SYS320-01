. "C:\Users\champuser\SYS320-01\Week7\configurationFunctions.ps1"
. "C:\Users\champuser\SYS320-01\Week7\Scheduler.ps1"
. "C:\Users\champuser\SYS320-01\Week7\Email.ps1"
. "C:\Users\champuser\SYS320-01\Week6\Event-Logs.ps1"

$configuration = ReadConfig

$Failed = getFailedLogins $configuration.Days | Group-Object User | Select-Object Name, Count

SendAlertEmail ($Failed | Format-Table | Out-String)

ChooseTimeToRun($configuration.ExecutionTime)