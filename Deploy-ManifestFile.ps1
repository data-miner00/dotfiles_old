<#
.Synopsis
    Declaratively create/remove symbolic link/copy according to manifest file.
.Description
    Deploy the symbolic link or copy operation according to the manifest file description on current computer.
    Admin rights are required to run this script as it is required by creating the symbolic links.
    Symbolic links are applicable to individual files and folders.
    This script is compulsory to run on the current directory.

    Consider the manifest file as follows:
        #|Source|Destination|Type|
        |myfile.ps1|~/myfile.ps1|symlink|
        |myfolder|~/secretfolder|symlink|
        |myfile2.vim|~/myfile2.vim|copy|
    
    The above definition will create
        1. A symlink for `myfile.ps1` at the $HOME/myfile.ps1
        2. A symlink for folder `myfolder` at $HOME/secretfolder
        3. A copy of `myfile2.vim` at $HOME/myfile2.vim
    
    Note that the first row is the header for reference purpose.
    
    To undo the manifestation above, simply comment out the entries by a pound (`#`) sign and execute this script again as such:
        #|Source|Destination|Type|
        #|myfile.ps1|~/myfile.ps1|symlink|
        #|myfolder|~/secretfolder|symlink|
        #|myfile2.vim|~/myfile2.vim|copy|
    
    The above will remove any copies or symbolic link created.

    With this behaviour, feel free to comment/uncomment any entries at anytime according to your needs:
        #|Source|Destination|Type|
        |myfile.ps1|~/myfile.ps1|symlink|
        |myfolder|~/secretfolder|symlink|
        #|myfile2.vim|~/myfile2.vim|copy|
    
    This will only manifest the first and second entry on the file.

.Parameter ManifestFile
    The name or path of the manifest file. It defaults to `MANIFEST`.

.Example
    # Using the default manifest file name
    Deploy-ManifestFile

.Example
    # Using a custom manifest file name
    Deploy-ManifestFile -ManifestFile myManifest

.Example
    # Using a custom manifest file in a different path (wip)
    Deploy-ManifestFile -ManifestFile ~/Manifest
#>
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
