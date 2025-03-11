function Show-Colors {
    $colors = [enum]::GetValues([System.ConsoleColor])
    foreach ($bgcolor in $colors) {
        foreach ($fgcolor in $colors) { Write-Host "$fgcolor|"  -ForegroundColor $fgcolor -BackgroundColor $bgcolor -NoNewline }
        Write-Host " on $bgcolor"
    }
}

function Get-Colors {
    [Enum]::GetValues([System.ConsoleColor])
}

Export-ModuleMember -Function Show-Colors
Export-ModuleMember -Function Get-Colors

