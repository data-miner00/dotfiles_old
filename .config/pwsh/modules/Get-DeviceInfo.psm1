function Get-TopProcesses {
    param (
        [int]$count = 10
    )
    Get-Process | Sort-Object CPU -Descending | Select-Object -First $count  Name,Id,CPU,WS | Format-Table -AutoSize
}

function Get-TopFiles {
    param (
        [string]$path = ".",
        [int]$count = 10
    )
    Get-ChildItem -Path $path -Recurse | Sort-Object Length -Descending | Select-Object -First $count Name,Length,FullName | Format-Table -AutoSize
}

Export-ModuleMember -Function Get-TopProcesses, Get-TopFiles