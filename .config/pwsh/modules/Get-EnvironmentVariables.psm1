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
        [Parameter(Mandatory=$false, HelpMessage="The name of the environment variable.")]
        [string]$Name
    )

    if ($Name) {
        (Get-ChildItem env:$Name).Value
        return
    }

    Get-ChildItem env:* | Sort-Object name
}

Export-ModuleMember -Function Get-EnvironmentVariables