function Write-Hello {
    Param(
        [Parameter(Mandatory=$true, HelpMessage="What is your name?")]
        [string]$Name,

        [Parameter(Mandatory=$true, HelpMessage="How old are you?")]
        [int]$Age
    )

    Write-Host "Hello $Name, you are $Age years old!"
}

Export-ModuleMember -Function Write-Hello
