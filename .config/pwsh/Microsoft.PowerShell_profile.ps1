$DOTFILES="D:\Workspace\dotfiles"
$PSModuleFolder="$DOTFILES\.config\pwsh\modules"

neofetch --ascii $DOTFILES\.config\neofetch\ascii\windows_small.txt

Write-Host "Howdy folks!"

<#
.SYNOPSIS
    Shorthand to create a symbolic link.

.DESCRIPTION
    Takes in two parameters to create the symbolic link.

.PARAMETER $target
    Indicates the destination in which the symlink will be created.

.PARAMETER $source
    Indicates the source of the actual file to be used to create the symlink.

.EXAMPLE
    ln .vimrc $DOTFILES/.vimrc
#>
function ln ($target, $source) {
    New-Item -Path $target -ItemType SymbolicLink -Value $source
}

Import-Module -Name $PSModuleFolder\library.psm1