# Powershell

# Check last reboot time
# Better option 1 using CIM:
Get-CimInstance -ClassName win32_operatingsystem | select csname, lastbootuptime

# Option 2 using WMI:
Get-WmiObject win32_operatingsystem | select csname, @{LABEL='LastBootUpTime';EXPRESSION={$_.ConverttoDateTime($_.lastbootuptime)}}