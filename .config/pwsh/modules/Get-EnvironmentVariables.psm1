function Get-EnvironmentVariables {
    Get-ChildItem env:* | Sort-Object name
}

Export-ModuleMember -Function Get-EnvironmentVariables