Param(
    [Parameter(Mandatory=$true, HelpMessage="The path to the module list file.")]
    [string]$CsvModuleListPath
)

if ([string]::IsNullOrWhiteSpace($CsvModuleListPath)) {
    throw "The module list file is invalid"
}

Get-InstalledModule `
| Select-Object -Property Name, Version, Type, Description, Author, PublishedDate `
| Export-Csv -Path $CsvModuleListPath -NoTypeInformation

Write-Host "Lockfile created at '$CsvModuleListPath'"