Param (
    [Parameter(Mandatory=$true, HelpMessage="The path to the module list file.")]
    [string]$CsvModuleListPath
)

if ([string]::IsNullOrWhiteSpace($CsvModuleListPath) -or !(Test-Path $CsvModuleListPath)) {
    throw "The module list file is missing or invalid"
}

$modules = Import-Csv -Path $CsvModuleListPath

foreach ($module in $modules) {
    Install-Module -Name $module.Name -RequiredVersion $module.Version -Force
}

Write-Host "Done installing $($modules | Measure-Object) modules."