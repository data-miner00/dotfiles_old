<#
.Synopsis
    Retrieves all environment variables on the computer.
.Description
    Gets all environment variables set on the computer sorted by name in ascending order.
#>
function Get-EnvironmentVariables {
    Get-ChildItem env:* | Sort-Object name
}

Export-ModuleMember -Function Get-EnvironmentVariables