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