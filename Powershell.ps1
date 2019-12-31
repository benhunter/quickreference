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

# Check and change ExecutionPolicy
Get-ExecutionPolicy
Set-ExecutionPolicy Unrestricted
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force

## Environment Variables
# https://ss64.com/ps/syntax-env.html
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-6
# Session Environment Variables
$env:VARIABLE_NAME = $value # Set
$env:VARIABLE_NAME # Get
# Get and Set User Environment Variables. Uses .NET
[System.Environment]::GetEnvironmentVariable('VARIABLE_NAME', [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('VARIABLE_NAME', $value, [System.EnvironmentVariableTarget]::User)


