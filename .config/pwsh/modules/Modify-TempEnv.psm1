<#
.Synopsis
    Adds a path to the temporary environment.
.Description
    Adds a path to the current session's environment variable. It will be removed when the session is closed.
.Parameter Path
    The temporary environment path.
.Example
    Add-TempEnv -Path "C:\Program Files\Git\cmd"
    Adds the Git command line tools to the temporary environment.
#>
function Add-TempEnv {
    Param (
        [Parameter(Mandatory=$true, HelpMessage="The temporary environment path.")]
        [string]$Path
    )

    $env:Path += "$Path;"

    Write-Host "Added $Path to the temporary environment."
}

<#
.Synopsis
    Removes a path from the environment variable temporarily.
.Description
    Removes a path from the current session's environment variable. 
.Parameter Path
    The path to be removed temporarily.
.Example
    Remove-TempEnv -Path "C:\Program Files\Git\cmd"
    Removes the Git command line tools from the environment variable temporarily.
#>
function Remove-TempEnv {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory=$true, HelpMessage="The environment path loaded in the current session to be removed.")]
        [string]$Path
    )

    if (-not (Test-Path -Path $Path)) {
        Write-Error "The path $Path is not valid or does not exist."
        return
    }

    $EscapedPath = [Regex]::Escape($Path)

    $env:Path = $env:Path -replace "$EscapedPath;", ""

    Write-Host "Removed $Path from the current session's environment variable."
}

<#
.Synopsis
    Removes a path from the environment variable temporarily.
.Description
    Removes a path from the current session's environment variable. 
.Parameter Path
    The path to be removed temporarily.
.Example
    Remove-TempEnv -Path "C:\Program Files\Git\cmd"
    Removes the Git command line tools from the environment variable temporarily.
#>
function Remove-TempEnv2 {
    Param (
        [Parameter(Mandatory=$true, HelpMessage="The environment path loaded in the current session to be removed.")]
        [string]$Path
    )

    $env:Path = ($env:Path -split ";" | Where-Object { $_ -ne $Path }) -join ";"

    Write-Host "Removed $Path from the current session's environment variable."
}

Export-ModuleMember Add-TempEnv, Remove-TempEnv, Remove-TempEnv2
