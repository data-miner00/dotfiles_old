Param (
    [Parameter(Mandatory=$false, HelpMessage="The manifest file that describes the symlink.")]
    [string]$ManifestFile = "MANIFEST"
)

$ErrorActionPreference = "Stop"

function Main {
    # For some reason, administrator mode will not recognize current path when reading file below.
    $ManifestFile = "$(Get-Location)/$ManifestFile"

    ExitIfNotAdmin

    Write-Host "Deploying $ManifestFile..."

    $lines = [System.IO.File]::ReadAllLines($ManifestFile)
    $header = ExtractHeaderFromManifest -RawHeaderString $lines[0]

    [System.Collections.ArrayList]$WillAdd  = @()
    [System.Collections.ArrayList]$WillRemove  = @()

    $WillAdd.Add($header) *>$null

    foreach ($line in $lines) {
        if (!$line.StartsWith('#')) {
            $WillAdd.Add($line.Trim('|')) *>$null
        } else {
            $WillRemove.Add($line.Substring(1).Trim('|')) *>$null
        }
    }

    $ManifestFileTemp = "$ManifestFile.tmp"
    $ManifestFileRemove = "$ManifestFile.rmv"

    [System.IO.File]::WriteAllLines($ManifestFileTemp, $WillAdd)
    [System.IO.File]::WriteAllLines($ManifestFileRemove, $WillRemove)

    $unlinkCount = PerformUnlinking -TempManifestFileName $ManifestFileRemove
    $linkCount = PerformLinking -TempManifestFileName $ManifestFileTemp

    Remove-Item -Path $ManifestFileTemp
    Remove-Item -Path $ManifestFileRemove

    Write-Host Successfully performed $linkCount linking and $unlinkCount unlinking.
}

function ExitIfNotAdmin {
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    $isAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

    if (!$isAdmin) {
        throw "Admin rights is needed for symlink"
    }
}

function ExtractHeaderFromManifest {
    Param (
        [Parameter(Mandatory=$true)]
        [string]$RawHeaderString
    )
    $header = $RawHeaderString.Substring(2).TrimEnd('|')

    return $header
}

function PerformUnlinking {
    Param (
        [Parameter(Mandatory=$true)]
        [string]$TempManifestFileName
    )

    $data = Import-Csv $TempManifestFileName -Delimiter "|"
    $counter = 0

    foreach ($row in $data) {
        if ((Get-Item $row.Destination -ErrorAction SilentlyContinue)) {
            Remove-Item $row.Destination
            Write-Host "[ok] Removed symlink at $($row.Destination)"
            $counter++
        }
    }

    return $counter
}

function PerformLinking {
    Param (
        [Parameter(Mandatory=$true)]
        [string]$TempManifestFileName
    )

    $data = Import-Csv $TempManifestFileName -Delimiter "|"
    $counter = 0

    foreach ($row in $data) {
        if ((Get-Item $row.Destination -ErrorAction SilentlyContinue)) {
            Write-Warning "[skipped] The $($row.Destination) already exist"
        } else {
            New-Item -Path $row.Destination -ItemType SymbolicLink -Value $row.Source 1>$null
            Write-Host "[ok] Created symlink at $($row.Destination)"
            $counter++
        }
    }

    return $counter
}

Main
