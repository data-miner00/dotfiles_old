<#
.Synopsis
    Open a personal GitHub repository quickly.
.Description
    Open the GitHub repository owned by `$GitHubUsername` with default browser.
.Parameter RepositoryName
    The repository name to be opened.
.Example
    # Given $GitHubUsername is data-miner00, opens `https://github.com/data-miner00/sandbox.ps1` in browser.
    Open-GitHubRepository sandbox.ps1
#>
function Open-GitHubRepository {
    Param(
        [Parameter(Mandatory=$true, HelpMessage="The repository name on GitHub.")]
        [string]$RepositoryName
    )

    if ([string]::IsNullOrWhiteSpace($GitHubUsername)) {
        throw "The GitHub username variable was not set"
    }

    Write-Host "Opening '$GitHubUsername/$RepositoryName' on GitHub"

    Start-Process https://github.com/$GitHubUsername/$RepositoryName
}

Export-ModuleMember -Function Open-GitHubRepository