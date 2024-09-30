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
function New-Symlink ($target, $source) {
    if ([string]::IsNullOrWhiteSpace($target) -or [string]::IsNullOrWhiteSpace($source)) {
        throw "The parameters are invalid"
    }

    New-Item -Path $target -ItemType SymbolicLink -Value $source
}

Export-ModuleMember -Function New-Symlink
