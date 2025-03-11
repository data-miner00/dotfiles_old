<#
.Synopsis
    Retrieves the amount of available space on a disk drive.
.Description
    Get the amount of free space in various units of the attached storage in the computer.j
.Parameter DiskLetter
    The letter representing the physical disk drive. For example the letter 'C' represents the `C:` drive.
    Defaults to `C`.
.Parameter DisplayUnit
    The unit to be used for displaying the free space.
    Defaults to `kb`.
.Example
    # Using default parameters
    Get-FreeDiskSpace
.Example
    # Providing parameters
    Get-FreeDiskSpace -DiskLetter D -DisplayUnit gb
#>
function Get-FreeDiskSpace {
    param (
        [Parameter(Mandatory = $false, HelpMessage = "The disk drive letter.")]
        [string]$DiskLetter = "C",

        [Parameter(Mandatory = $false, HelpMessage = "Display unit.")]
        [string]$DisplayUnit = "kb"
    )

    $drive = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='$($DiskLetter):'"
    if ($drive) {
        switch ($DisplayUnit) {
            "bytes" {
                $freeSpace = $drive.FreeSpace
                Write-Host "Drive $DiskLetter has $freeSpace bytes free space."
            }
            "kb" {
                $freeSpace = [math]::Round($drive.FreeSpace / 1kb, 2)
                Write-Host "Drive $DiskLetter has $freeSpace kb free space."
            }
            "mb" {
                $freeSpace = [math]::Round($drive.FreeSpace / 1mb, 2)
                Write-Host "Drive $DiskLetter has $freeSpace mb free space."
            }
            "gb" {
                $freeSpace = [math]::Round($drive.FreeSpace / 1GB, 2)
                Write-Host "Drive $DiskLetter has $freeSpace GB free space."
            }
            default {
                Write-Error "Unrecognized unit '$DisplayUnit'"
            }
        }
    }
    else {
        Write-Error "Drive $DiskLetter not found."
    }
}

Export-ModuleMember -Function Get-FreeDiskSpace

