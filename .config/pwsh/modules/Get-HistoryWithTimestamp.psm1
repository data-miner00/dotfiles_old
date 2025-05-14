<#
.SYNOPSIS
    Displays the PowerShell history with timestamps.
.DESCRIPTION
    This function retrieves the PowerShell history and formats it to include timestamps for each command.
.EXAMPLE
    Get-HistoryWithTimestamp
    Displays the PowerShell history with timestamps in a table.
#>
function Get-HistoryWithTimestamp {
    Get-History | Format-Table Id, @{
        Label      = "Time"
        Expression = { $_.StartExecutionTime.ToString("yyyy-MM-dd HH:mm:ss") }
    }, CommandLine -AutoSize
}

Export-ModuleMember -Function Get-HistoryWithTimestamp

