function Write-Hello {
    Param(
        [Parameter(Mandatory=$true, HelpMessage="What is your name?")]
        [string]$Name,

        [Parameter(Mandatory=$true, HelpMessage="How old are you?")]
        [int]$Age
    )

    Write-Host "Hello $Name, you are $Age years old!"
}

function Switch-Location {
    Param (
        [Parameter(Mandatory=$true, HelpMessage="The location to move to.")]
        [ValidateSet("dl", "ws", "home")]
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
        default {
            Write-Error "Invalid location provided."
        }
    }
}

function Switch-PreviousLocation {
    Param (
        [ValidateRange(1, 3)]
        [Parameter(Mandatory=$false, HelpMessage="The level of directories to return to.")]
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

Export-ModuleMember -Function Write-Hello
Export-ModuleMember -Function Switch-Location
Export-ModuleMember -Function Switch-PreviousLocation
