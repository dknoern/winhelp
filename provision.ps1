if (!(Test-Path '.\Desktop\postinstall.txt'))
{
  echo 'First pass, installing'

  Add-Content 'Desktop\postinstall.txt' 'enabling openSSH'
  Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

  Add-Content 'Desktop\postinstall.txt' 'installing chocolatey'
  Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

  Add-Content 'Desktop\postinstall.txt' 'installing firefox'
  choco install firefox -y

  Add-Content 'Desktop\postinstall.txt' 'installing gecko selenium driver'
  choco install selenium-gecko-driver

  Add-Content 'Desktop\postinstall.txt' 'installing nodejs'
  choco install nodejs

  Add-Content 'Desktop\postinstall.txt' 'restarting host'
  Restart-Computer
}
else
{
  echo 'Second pass, starting OpenSSH'

  Add-Content 'Desktop\postinstall.txt' 'starting sshd'
  Start-Service sshd
}
