function Search-Google {
    $connected = [string]::Join(" ", $args)

    $googleUrl = "https://www.google.com/search?q=$([uri]::EscapeDataString($connected))"

    [System.Diagnostics.Process]::Start("chrome", $googleUrl)
}

function Search-Google2 {
    $connected = [string]::Join(" ", $args)

    $response = Invoke-WebRequest -Uri "https://www.google.com/search?q=$([uri]::EscapeDataString($connected))"

    $response | Select-Object -Property Content | Write-Host
}

Export-ModuleMember -Function Search-Google
Export-ModuleMember -Function Search-Google2