<#

#>
Function Get-AppInfo {
    [CmdletBinding()]
    Param(
        # Used to find a specfic application. 
        [String]
        $AppName,

        # Returns all installed applications.
        [switch]
        $All
    )

    $RegPath = @(
        'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*',
        'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
    )
    
    If ($All){
        $RegQuery =  $( Get-ItemProperty -Path $RegPath )
    }
    Else{
        $RegQuery = $( Get-ItemProperty -Path $RegPath | Where-Object {$_.DisplayName -match $AppName} )
    }

    return $RegQuery
}
