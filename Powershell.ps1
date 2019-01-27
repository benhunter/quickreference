# Powershell

# Equivalent to which in linux
# https://stackoverflow.com/questions/63805/equivalent-of-nix-which-command-in-powershell
Get-Command python

# Make an alias and store it in user profile
New-Alias which get-command
"`nNew-Alias which get-command" | add-content $profile

# Check last reboot time
# Better option 1 using CIM:
Get-CimInstance -ClassName win32_operatingsystem | select csname, lastbootuptime

# Option 2 using WMI:
Get-WmiObject win32_operatingsystem | select csname, @{LABEL='LastBootUpTime';EXPRESSION={$_.ConverttoDateTime($_.lastbootuptime)}}
