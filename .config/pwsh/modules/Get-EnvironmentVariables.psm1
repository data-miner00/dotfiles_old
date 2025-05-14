<#
.Synopsis
    Retrieves all environment variables on the computer.
.Description
    Gets all environment variables set on the computer sorted by name in ascending order.
.Parameter Name
    The name of the environment variable to retrieve.
.Example
    Get-EnvironmentVariables
.Example
    Get-EnvironmentVariables -Name "Path"
#>
function Get-EnvironmentVariables {
    Param (
        [Parameter(Mandatory = $false, HelpMessage = "The name of the environment variable.")]
        [string]$Name
    )

    if ($Name) {
        (Get-ChildItem env:$Name).Value
        return
    }

    Get-ChildItem env:* | Sort-Object name
}

<#
.Synopsis
    Search all environment variables on the computer.
.Description
    Search all environment variables set on the computer sorted by name in ascending order.
.Parameter Key
    The key to search for in the environment variable name
.Example
    Search-EnvironmentVariables -Key "Path"
#>
function Search-EnvironmentVariables {
    Param (
        [Parameter(Mandatory = $true, HelpMessage = "The key to search for in the environment variable name")]
        [string]$Key
    )

    Get-ChildItem Env: | Where-Object { $_.Name -like "*$Key*" } |
        Sort-Object Name | Format-Table Name, Value -AutoSize
}

Export-ModuleMember -Function Get-EnvironmentVariables
Export-ModuleMember -Function Search-EnvironmentVariables

