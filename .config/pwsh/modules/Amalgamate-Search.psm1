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
    6. Crates.io (crates)
    7. Docker Hub (dockerhub)
    8. Nuget.org (nuget)
    9. PowerShell Gallery (psgallery)
    10. Melpa
    11. Chocolatey
    12. MetaCPan
    13. Maven
    14. FlatHub
    15. Hex.pm (hexpm)
    16. Hackage
    17. Gradle
    18. Pub.dev (pub)
    19. Vagrant
    20. Clojars
    21. Open Source Insights (deps)
    22. D Package registry (dub)
    23. RubyGems
    24. JuliaHub
    25. Packagist

    AI:
    1. Kaggle
    2. Hugging Face (hugging)

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
    Amalgamate-Search google what is cask
    # Search with single provider (google)

.Example
    Amalgamate-Search github crystal
    # Search with single provider (github)

.Example
    Amalgamate-Search -Profile General what is HTTPs
    # Search with 'General' profile
#>
function Amalgamate-Search {
    $SearchSites = Import-PowerShellDataFile $PSModuleFolder/searches/sites.psd1
    $Profiles = Import-PowerShellDataFile $PSModuleFolder/searches/profile.psd1

    $searchTarget = $args[0]
    
    # Bulk search
    if ($searchTarget.Equals(("-Profile"))) {
        $selectedProfile = $Profiles[$args[1]]
        $searchQueries = [uri]::EscapeDataString([string]::Join(" ", $($args | Select-Object -Skip 2)))
        
        $selectedProfile | ForEach-Object {
            $searchUrl = $SearchSites[$_]
            Start-Process $($searchUrl + $searchQueries)
        }

    }
    else { # Single search
        $searchQueries = [uri]::EscapeDataString([string]::Join(" ", $($args | Select-Object -Skip 1)))
        $searchUrl = $SearchSites[$searchTarget]
        Start-Process $($searchUrl + $searchQueries)
    }
}

Export-ModuleMember -Function Amalgamate-Search

