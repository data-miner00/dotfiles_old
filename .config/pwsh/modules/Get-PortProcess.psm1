<#
.SYNOPSIS
    Get the process using a specific port.
.DESCRIPTION
    This function retrieves the process that is using a specified port on the local machine.
.PARAMETER Port
    The port number to check.
.EXAMPLE
    Get-PortProcess -Port 80
    This command retrieves the process using port 80.
#>
function Get-PortProcess {
    Param (
        [Parameter(Mandatory = $true, Position = 0, HelpMessage = "Port number to check.")]
        [int]$Port
    )

    $PortProcess = Get-NetTCPConnection | Where-Object { $_.LocalPort -eq $Port } | Select-Object -Property OwningProcess

    if ($PortProcess) {
        $Process = Get-Process -Id $PortProcess.OwningProcess
        Write-Host "Port $Port is being used by process ID $($Process.Id) - $($Process.ProcessName)"
    }
    else {
        Write-Host "Port $Port is not in use."
    }
}

Export-ModuleMember -Function Get-PortProcess

