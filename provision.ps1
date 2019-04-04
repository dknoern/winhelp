Add-Content 'C:\postinstall.txt' 'enabling openSSH'
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

Add-Content 'C:\postinstall.txt' 'creating startup ps1 file'
Add-Content 'C:\startup.ps1' 'Start-Service sshd' >> 'C:\postinstall.txt' 2>&1

Add-Content 'C:\postinstall.txt' 'creating startup cmd file'
Add-Content 'C:\Users\davidk\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\startup.cmd' 'PowerShell -Command "Set-ExecutionPolicy Unrestricted" >> "C:\startlog.txt" 2>&1; PowerShell C:\startup.ps1 >> "C:\startlog.txt" 2>&1'  >> 'C:\postinstall.txt' 2>&1

Add-Content 'C:\postinstall.txt' 'installing chocolatey'
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Add-Content 'C:\postinstall.txt' 'installing firefox'
choco install firefox -y

Add-Content 'C:\postinstall.txt' 'installing gecko selenium driver'
choco install selenium-gecko-driver -y

Add-Content 'C:\postinstall.txt' 'installing nodejs'
choco install nodejs -y

Add-Content 'C:\postinstall.txt' 'postinstall complete'
