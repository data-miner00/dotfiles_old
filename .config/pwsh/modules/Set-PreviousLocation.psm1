$global:lastLocation = $null

<#
.SYNOPSIS
    Return to the previous location in the file system.
.DESCRIPTION
    This function allows you to return to the previous location in the file system.
    It stores the last location before changing directories and allows you to return to it.
.EXAMPLE
    Set-PreviousLocation
#>
function Set-PreviousLocation {
    if ($global:lastLocation) {
        $currentLocation = Get-Location
        Set-Location -Path $global:lastLocation
        $global:lastLocation = $currentLocation
    } else {
        Write-Host "No previous location stored." -ForegroundColor Yellow
    }
}

$ExecutionContext.SessionState.InvokeCommand.PreCommandLookupAction = {
    param($commandName, $commandLookupEventArgs)
    
    if ($commandName -eq 'Set-Location' -or $commandName -eq 'cd' -or $commandName -eq 'pushd' -or $commandName -eq 'popd' -or $commandName -eq 'goto') {
        $global:lastLocation = Get-Location
    }
}

Export-ModuleMember -Function Set-PreviousLocation
