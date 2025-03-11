function Write-Hello {
    Param(
        [Parameter(Mandatory = $true, HelpMessage = "What is your name?")]
        [string]$Name,

        [Parameter(Mandatory = $true, HelpMessage = "How old are you?")]
        [int]$Age
    )

    Write-Host "Hello $Name, you are $Age years old!"
}

function Switch-Location {
    Param (
        [Parameter(Mandatory = $true, HelpMessage = "The location to move to.")]
        [ValidateSet("dl", "ws", "home", "vs", "p")]
        [string]$Location
    )

    switch ($Location) {
        "home" {
            Write-Host "[tips]: Perhaps cd ~ will be quicker"
            Set-Location -Path $HOME
        }
        "dl" {
            Set-Location -Path "~/Downloads"
        }
        "ws" {
            Set-Location -Path "$DDrive/Workspace"
        }
        "vs" {
            Set-Location -Path "$DDrive/Workspace/Visual Studio"
        }
        "p" {
            Set-Location -Path "$DDrive/Workspace/projects"
        }
        default {
            Write-Error "Invalid location provided."
        }
    }
}

function Switch-PreviousLocation {
    Param (
        [ValidateRange(1, 3)]
        [Parameter(Mandatory = $false, HelpMessage = "The level of directories to return to.")]
        [int]$Levels = 1
    )

    switch ($Levels) {
        1 {
            Set-Location -Path ..
        }
        2 {
            Set-Location -Path ../..
        }
        3 {
            Set-Location -Path ../../..
        }
    }
}

function Open-StartupFolder {
    explorer.exe shell:startup
}

function Get-GitCommitCount {
    $gitCommitCount = git rev-list --count HEAD
    Write-Host "The number of commits in the current branch is $gitCommitCount"
}

function Get-CharacterCount {
    Param (
        [Parameter(Mandatory = $true, HelpMessage = "The string to count characters from.")]
        [string]$String
    )

    $charCount = $String.Length
    Write-Host "The number of characters in the string is $charCount"
}

function Get-Uptime {
    (Get-Date) - (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
}

function Search-History {
    Param([string]$searchTerm)
    Get-History | Where-Object { $_.CommandLine -like "*$searchTerm*" }
}

function Copy-Path {
    Set-Clipboard -Value (Get-Location).Path
}

function Test-ConnectionQuick {
    Test-Connection -ComputerName "google.com" -Count 2
}

function New-RandomPassword {
    Param([int]$Length = 12)
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()"
    $password = -join (1..$Length | ForEach-Object { $chars[(Get-Random -Minimum 0 -Maximum $chars.Length)] })
    return $password
}

Export-ModuleMember -Function Write-Hello
Export-ModuleMember -Function Switch-Location
Export-ModuleMember -Function Switch-PreviousLocation
Export-ModuleMember -Function Open-StartupFolder
Export-ModuleMember -Function Get-GitCommitCount
Export-ModuleMember -Function Get-CharacterCount
Export-ModuleMember -Function Get-Uptime
Export-ModuleMember -Function Search-History
Export-ModuleMember -Function Copy-Path
Export-ModuleMember -Function Test-ConnectionQuick
Export-ModuleMember -Function New-RandomPassword

