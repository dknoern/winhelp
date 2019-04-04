Add-Content 'C:\postinstall.txt' 'enabling openSSH'
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

Add-Content 'C:\postinstall.txt' 'scheduling sshd startup on reboot'
$trigger = New-JobTrigger -AtStartup -RandomDelay 00:00:30
Register-ScheduledJob -Trigger $trigger -ScriptBlock {Start-Service sshd} -Name StartOpenSSH >> 'C:\postinstall.txt' 2>&1

Add-Content 'C:\postinstall.txt' 'installing chocolatey'
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) >> 'C:\postinstall.txt' 2>&1

Add-Content 'C:\postinstall.txt' 'installing firefox'
choco install firefox -y >> 'C:\postinstall.txt' 2>&1

Add-Content 'C:\postinstall.txt' 'installing gecko selenium driver'
choco install selenium-gecko-driver -y >> 'C:\postinstall.txt' 2>&1

Add-Content 'C:\postinstall.txt' 'installing nodejs'
choco install nodejs -y >> 'C:\postinstall.txt' 2>&1

Add-Content 'C:\postinstall.txt' 'postinstall complete'
