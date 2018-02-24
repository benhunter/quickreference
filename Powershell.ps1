# Powershell

# Check last reboot time
Get-CimInstance -ClassName win32_operatingsystem | select csname, lastbootuptime
