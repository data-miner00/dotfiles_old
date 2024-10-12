# This script cannot be wrapped in a module because for some reason
# the modules weren't refreshed.

$ErrorActionPreference = "Stop"

. $PROFILE

$Metadata = Import-PowerShellDataFile $PSModuleFolder\metadata.psd1

foreach ($Module in $Metadata.CustomModules) {
    Remove-Module $(Get-Module $Module)
    Import-Module -Name $PSModuleFolder\$Module.psm1
    Write-Host "[ok] Successfully refreshed $Module."
}
