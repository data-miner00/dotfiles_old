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
.Parameter Preview
    Dry-run the execution before commiting the changes.
.Example
    # Formatting a source file.
    Format-PowerShellFile -FilePath ~/myscript.ps1
.Example
    # Formatting a source file and prints the original content.
    Format-PowerShellFile -FilePath ~/myscript.ps1 -PrintOriginal
.Example
    # Preview the changes. No need to provide `-PrintOriginal`.
    Format-PowerShellFile -FilePath ~/myscript.ps1 -Preview
#>
function Format-PowerShellFile {
    param (
        [Parameter(Mandatory=$true, HelpMessage="The path to the file")]
        [string]$FilePath,

        [Parameter(Mandatory=$false, HelpMessage="Whether to print out the formatted content or not")]
        [switch]$PrintOriginal,

        [Parameter(Mandatory=$false, HelpMessage="Preview the changes instead of commiting the changes.")]
        [switch]$Preview
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

    if ($PrintOriginal -or $Preview) {
        Write-Host $formatted -ForegroundColor DarkMagenta
    }

    if ($Preview) {
        Write-Host "Script exited in preview mode"
        return
    }

    $formatted | Set-Content -Path $FilePath
    Write-Host "[ok] Formatted '$FilePath'"
}