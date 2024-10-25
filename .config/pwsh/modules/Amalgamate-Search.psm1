<#
.Synopsis
    Enhanced searching on the internet.
.Description
    Search through the internet with different search providers.
    
    Search engine:
    1. Google
    2. Bing
    3. Duckduckgo
    4. Yahoo
    5. Yandex
    6. Qwant

    Package repository:
    1. Scoop
    2. Nixpkgs
    3. PyPi
    4. NPM
    5. jsr
    6. Crates.io
    7. Docker Hub
    8. Nuget.org
    9. PowerShell Gallery
    10. Melpa
    11. Chocolatey
    12. MetaCPan
    13. Maven
    14. FlatHub
    15. Hex.pm
    16. Hackage
    17. Gradle
    18. Pub.dev

    Socials:
    1. GitHub
    2. GitLab
    3. Codeberg
    4. Reddit

    Linux:
    1. Arch Linux
    2. Debian
    3. Gentoo
.Parameter Profile
    Optional. Specifies the bulk search profile. Single search if not provided.
    Available choice are `General` and `Code`.
    1. General - Bulk search through Google, Bing, Duckduckgo and Qwant
    2. Code - Bulk search through GitHub, GitLab and Codeberg
.Example
    # Search with single provider (google)
    Amalgamate-Search google what is cask

.Example
    # Search with single provider (github)
    Amalgamate-Search github crystal

.Example
    # Search with 'General' profile
    Amalgamate-Search -Profile General what is HTTPs
#>
function Amalgamate-Search {
    $SearchSites = Import-PowerShellDataFile $PSModuleFolder/searches/sites.psd1
    $Profiles = Import-PowerShellDataFile $PSModuleFolder/searches/profile.psd1

    $searchTarget = $args[0]
    
    if ($searchTarget.Equals(("-Profile"))) {
        $selectedProfile = $Profiles[$args[1]]
        $searchQueries = [uri]::EscapeDataString([string]::Join(" ", $($args | Select-Object -Skip 2)))
        
        $selectedProfile | ForEach-Object {
            $searchUrl = $SearchSites[$_]
            Start-Process $($searchUrl + $searchQueries)
        }
    } else {
        $searchQueries = [uri]::EscapeDataString([string]::Join(" ", $($args | Select-Object -Skip 1)))
        $searchUrl = $SearchSites[$searchTarget]
        Start-Process $($searchUrl + $searchQueries)
    }
}

Export-ModuleMember -Function Amalgamate-Search