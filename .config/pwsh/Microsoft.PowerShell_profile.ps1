neofetch.cmd

Write-Host "Howdy folks!"
$DOTFILES="D:\Workspace\dotfiles"
$PSModuleFolder="$DOTFILES\.config\pwsh\modules"

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