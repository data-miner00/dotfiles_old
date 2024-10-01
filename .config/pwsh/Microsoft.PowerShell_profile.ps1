$DOTFILES="D:\Workspace\dotfiles"
$PSModuleFolder="$DOTFILES\.config\pwsh\modules"

neofetch --ascii $DOTFILES\.config\neofetch\ascii\windows_small.txt

Write-Host "Howdy folks!"

Import-Module -Name $PSModuleFolder\New-Symlink.psm1
Import-Module -Name $PSModuleFolder\library.psm1
Import-Module -Name $PSModuleFolder\Format-PowerShellFile.psm1

Set-Alias -Name ln -Value New-Symlink
Set-Alias -Name np -Value notepad.exe
Set-Alias -Name exp -Value explorer.exe