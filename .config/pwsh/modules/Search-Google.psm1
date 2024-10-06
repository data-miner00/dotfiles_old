<#
.Synopsis
    Search Google from command line (not really).
.Description
    Opens up the Google Search result on Chrome with the arguments provided.
.Example
    Search-Google what is html
#>
function Search-Google {
    $parsedArguments = [string]::Join(" ", $args)

    $googleUrl = "https://www.google.com/search?q=$([uri]::EscapeDataString($parsedArguments))"

    [System.Diagnostics.Process]::Start("chrome", $googleUrl)
}

<#
.Synopsis
    Search Google from command line (bad).
.Description
    Search Google with the arguments provided with Invoke-WebRequest and prints out the search page's source code in the terminal.
.Example
    Search-Google2 what is html
#>
function Search-Google2 {
    $parsedArguments = [string]::Join(" ", $args)

    $response = Invoke-WebRequest -Uri "https://www.google.com/search?q=$([uri]::EscapeDataString($parsedArguments))"

    $response | Select-Object -Property Content | Write-Host
}

Export-ModuleMember -Function Search-Google
Export-ModuleMember -Function Search-Google2