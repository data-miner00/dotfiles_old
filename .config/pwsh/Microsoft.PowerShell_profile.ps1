$DDrive="D:"
$DOTFILES="$DDrive\Workspace\dotfiles"
$PSModuleFolder="$DOTFILES\.config\pwsh\modules"

neofetch --ascii $DOTFILES\.config\neofetch\ascii\windows_small.txt

Write-Host "Howdy folks!"

Import-Module -Name $PSModuleFolder\New-Symlink.psm1
Import-Module -Name $PSModuleFolder\library.psm1
Import-Module -Name $PSModuleFolder\Format-PowerShellFile.psm1
Import-Module -Name $PSModuleFolder\Search-Google.psm1
Import-Module -Name $PSModuleFolder\Show-Calendar.psm1
Import-Module -Name $PSModuleFolder\Push-GitTag.psm1
Import-Module -Name $PSModuleFolder\Get-EnvironmentVariables.psm1
Import-Module -Name $PSModuleFolder\Prune-LocalBranch.psm1 -DisableNameChecking

Set-Alias -Name ln -Value New-Symlink
Set-Alias -Name np -Value notepad.exe
Set-Alias -Name exp -Value explorer.exe
Set-Alias -Name google -Value Search-Google
Set-Alias -Name envs -Value Get-EnvironmentVariables # 'env' conflicts with scoop install script
Set-Alias -Name goto -Value Switch-Location

function reason {
    Write-Host The Solar Council has neutralised your intent to break the rules.
}

function ip {
    Invoke-WebRequest ifconfig.me | Select-Object -Property Content
}

$ENV:STARSHIP_CONFIG = "$HOME/.config/starship.toml"
$ENV:STARSHIP_CACHE = "$HOME/AppData/Local/Temp" # logging

# Start Starship
Invoke-Expression (&starship init powershell)
