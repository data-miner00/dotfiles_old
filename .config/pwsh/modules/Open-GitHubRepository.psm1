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