# Get-AppInfo
This is used to get quick information about currently installed applications.

## Syntax
* Get-AppInfo -All
  * This will return all information about installed programs.
* Get-AppInfo -AppName "Cisco AnyConnect"
  * This will return information on programs that match "Cisco AnyConnect"

## Examples
* Used as a detection method
  * If(-Not(Get-AppInfo -AppName "YourApp")){return $false}
* Dynamic uninstall(s)
  * $Apps = Get-AppInfo -AppName "YourApp" | Select-Object UninstallString
  * $Apps | ForEach( Start-Process cmd.exe -ArgumentList ("/c {0} /passive /norestart" -f $_)
