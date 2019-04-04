Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Add-Content 'c:\postinstall.txt' 'Hello from post install thingy'
Add-Content 'c:\postinstall.txt' 'installing chocolatey'


Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Add-Content 'c:\postinstall.txt' 'installing firefox'

choco install firefox -y

Add-Content 'c:\postinstall.txt' 'done'
