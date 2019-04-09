Add-Content 'C:\postinstall.txt' 'installing chocolatey'
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) >> 'C:\postinstall.txt' 2>&1

Add-Content 'C:\postinstall.txt' 'installing firefox'
choco install firefox -y >> 'C:\postinstall.txt' 2>&1

Add-Content 'C:\postinstall.txt' 'installing gecko selenium driver'
choco install selenium-gecko-driver -y >> 'C:\postinstall.txt' 2>&1

#Add-Content 'C:\postinstall.txt' 'installing git'
choco install git -y >> 'C:\postinstall.txt' 2>&1

#Add-Content 'C:\postinstall.txt' 'installing nodejs'
choco install nodejs -y >> 'C:\postinstall.txt' 2>&1

Add-Content 'C:\postinstall.txt' 'installing openssh'
choco install openssh -params '"/SSHServerFeature /KeyBasedAuthenticationFeature"' -y >> 'C:\postinstall.txt' 2>&1

Add-Content 'C:\postinstall.txt' 'postinstall complete'
