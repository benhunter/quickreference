# Powershell

# Equivalent to which in linux
# https://stackoverflow.com/questions/63805/equivalent-of-nix-which-command-in-powershell
Get-Command python

# Make an alias and store it in user profile
New-Alias which get-command
"New-Alias which get-command" | add-content $profile

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
# Session Environment Variables (do not persist in user environment)
$env:VARIABLE_NAME = $value # Set
$env:VARIABLE_NAME # Get
# Get and Set User Environment Variables. Uses .NET
[System.Environment]::GetEnvironmentVariable('VARIABLE_NAME', [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable('VARIABLE_NAME', $value, [System.EnvironmentVariableTarget]::User)

# Linux less equivalent
out-host -paging

# Pop up message box
Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Finished', 'Done')

# List all file system drives
Get-PSDrive -PSProvider 'FileSystem'

# Single Quotes vs Double Quotes
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules?view=powershell-7.1
$i = 5
"The value of $i is $i."  # expanded
'The value of $i is $i.'  # literal, not expanded

# Robocopy (also available in cmd)
robocopy $source $dest /zb /MT:32 /s  # requires admin privilege because of /zb. Use /z without admin.



# Size of the current directory
$directory = Get-Item .
$directory | Get-ChildItem | Measure-Object -Sum Length | Select-Object `
  @{Name=”Path”; Expression={$directory.FullName}}, @{Name=”Files”; Expression={$_.Count}}, @{Name=”Size”; Expression={$_.Sum}}


ls -force # include hidden files
