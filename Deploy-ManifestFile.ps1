Param (
    [Parameter(Mandatory=$false, HelpMessage="The manifest file")]
    [string]$ManifestFile = "MANIFEST"
)

# For some reason, administrator mode will not recognize current path when reading file below.
$ManifestFile = "$(Get-Location)/$ManifestFile"

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$isAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (!$isAdmin) {
    throw "Admin rights is needed for symlink"
}

Write-Host "Deploying $ManifestFile..."

$lines = [System.IO.File]::ReadAllLines($ManifestFile)

$firstLine = $lines[0]
$header = $firstLine.Substring(2).TrimEnd('|')

[System.Collections.ArrayList]$WillProcess  = @()
[System.Collections.ArrayList]$WillRemove  = @()

$WillProcess.Add($header) *>$null
$WillRemove.Add($header) *>$null

foreach ($line in $lines) {
    if (!$line.StartsWith('#')) {
        $WillProcess.Add($line.Trim('|')) *>$null
    } else {
        $WillRemove.Add($line.Substring(1).Trim('|')) *>$null
    }
}

$ManifestFileTemp = "$ManifestFile.tmp"
$ManifestFileRemove = "$ManifestFile.rmv"

[System.IO.File]::WriteAllLines($ManifestFileTemp, $WillProcess)
[System.IO.File]::WriteAllLines($ManifestFileRemove, $WillRemove)

$CsvRemoveContent = Import-Csv $ManifestFileRemove -Delimiter "|"

foreach ($entry in $CsvRemoveContent) {
    if ((Get-Item $entry.Destination -ErrorAction SilentlyContinue)) {
        Remove-Item $entry.Destination
        Write-Host "[ok] Removed symlink at $($entry.Destination)"
    }
}

$CsvContent = Import-Csv $ManifestFileTemp -Delimiter "|"

foreach ($entry in $CsvContent) {
    if ((Get-Item $entry.Destination -ErrorAction SilentlyContinue)) {
        Write-Warning "[skipped] The $($entry.Destination) already exist"
    } else {
        New-Item -Path $entry.Destination -ItemType SymbolicLink -Value $entry.Source 1>$null
        Write-Host "Created symlink at $($entry.Destination)"
    }
}

Remove-Item -Path $ManifestFileTemp
Remove-Item -Path $ManifestFileRemove

Write-Host Done