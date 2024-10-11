<#
.Synopsis
    Open a personal GitHub repository quickly.
.Description
    Opening GitHub repositories with extended functionality such as abbreviation and pull request.
    Supported repositories:
        1. p - sandbox.ps1
        2. n - nixbox
        3. d - dotfiles
        4. do - dotfiles_old
        5. l - "Linker"
        6. s - "Sway"
        7. ss - "Screenshot"
        8. k - "KeyLogger"
        9. c - "custom-lang"
        10. b - "bot"
.Parameter Shorthand
    The abbreviated repository name. Must be recognized in the hashtable.
.Parameter PullRequest
    A switch parameter to indicate whether to open the pull request page.
#>
function Open-GitHubRepository2 {
    param (
        [Parameter(Mandatory=$true, HelpMessage="The recognized repository name shorthand.")]
        [ValidateSet("p", "n", "d", "do", "l", "s", "ss", "k", "c", "b")]
        [string]$Shorthand,

        [Parameter(Mandatory=$false, HelpMessage="Whether opens the Pull Requests' page")]
        [Alias("PR")]
        [switch]$PullRequest
    )

    if ([string]::IsNullOrWhiteSpace($GitHubUsername)) {
        throw "The GitHub username variable was not set"
    }

    $MyRepositoryMappings = @{
        p = "sandbox.ps1"
        n = "nixbox"
        d = "dotfiles"
        do = "dotfiles_old"
        l = "Linker"
        s = "Sway"
        ss = "Screenshot"
        k = "KeyLogger"
        c = "custom-lang"
        b = "bot"
    }

    if ($PullRequest) {
        Start-Process https://github.com/$GitHubUsername/$($MyRepositoryMappings[$Shorthand])/pulls
    } else {
        Start-Process https://github.com/$GitHubUsername/$($MyRepositoryMappings[$Shorthand])
    }
}

Export-ModuleMember -Function Open-GitHubRepository2