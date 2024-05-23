# Time Formats

## Cheat sheets
- https://devhints.io/datetime
- Crontab https://crontab.guru/

## File or Path Friendly

### Linux/Bash

```
date -u +%Y-%m-%d-%H%M%SZ  # With dashes
$(date -u +%Y-%m-%d-%H%M%SZ)

date -u +%Y%m%dT%H%M%SZ
```


### PowerShell
    Get-Date -Format FileDateTimeUniversal  # yyyyMMddTHHmmssffffZ - UTC
    Get-Date -Format FileDateTime  # yyyyMMddTHHmmssffff - Local

 - [Get-Date Powershell Docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-date?view=powershell-7)
