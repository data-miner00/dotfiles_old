<#
.Synopsis
    Formats a messy PowerShell source file.
.Description
    Formats a PowerShell source file according to the preset rules by Microsoft.
.Parameter FilePath
    The file path to the PowerShell source file.
.Parameter PrintOriginal
    Indicates whether to print the original content of the PowerShell source file.
    Defaults to `$false`.
.Example
    # Formatting a source file.
    Format-PowerShellFile -FilePath ~/myscript.ps1
.Example
    # Formatting a source file and prints the original content.
    Format-PowerShellFile -FilePath ~/myscript.ps1 -PrintOriginal
#>
function Format-PowerShellFile {
    param (
        [Parameter(Mandatory=$true, HelpMessage="The path to the file")]
        [string]$FilePath,

        [Parameter(Mandatory=$false, HelpMessage="Whether to print out the formatted content or not")]
        [bool]$PrintOriginal = $false
    )

    if ([string]::IsNullOrWhiteSpace($FilePath)) {
        throw "FilePath cannot be empty."
    }

    if (!(Test-Path $FilePath)) {
        throw "FilePath does not exist"
    }

    # TODO: Check for PSScriptAnalyzer module
    $content = Get-Content -Path $FilePath | Out-String
    $formatted = Invoke-Formatter -ScriptDefinition $content

    if ($PrintOriginal) {
        Write-Host $formatted
    }

    $formatted | Set-Content -Path $FilePath
    Write-Host "Formatted '$FilePath'"
}