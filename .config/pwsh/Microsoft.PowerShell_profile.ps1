$DOTFILES="D:\Workspace\dotfiles"
$PSModuleFolder="$DOTFILES\.config\pwsh\modules"

neofetch --ascii $DOTFILES\.config\neofetch\ascii\windows_small.txt

Write-Host "Howdy folks!"

Import-Module -Name $PSModuleFolder\New-Symlink.psm1
Import-Module -Name $PSModuleFolder\library.psm1
Import-Module -Name $PSModuleFolder\Format-PowerShellFile.psm1
Import-Module -Name $PSModuleFolder\Search-Google.psm1
Import-Module -Name $PSModuleFolder\Show-Calendar.psm1
Import-Module -Name $PSModuleFolder\Push-GitTag.psm1

Set-Alias -Name ln -Value New-Symlink
Set-Alias -Name np -Value notepad.exe
Set-Alias -Name exp -Value explorer.exe
Set-Alias -Name google -Value Search-Google

function reason {
    Write-Host The Solar Council has neutralised your intent to break the rules.
}