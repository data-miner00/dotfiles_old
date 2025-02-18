$DDrive="D:"
$DOTFILES="$DDrive\Workspace\dotfiles"
$PSModuleFolder="$DOTFILES\.config\pwsh\modules"
$PSScriptFolder="$DOTFILES\.config\pwsh\scripts"

# Load custom configurations
$Configs = Import-PowerShellDataFile -Path "$DOTFILES\.config\pwsh\Configurations.psd1"
$GitHubUsername = $Configs.GitHubUsername

neofetch --ascii $DOTFILES\.config\neofetch\ascii\windows_small.txt

if ($Configs.EnableWelcomeText) {
    Write-Host $Configs.WelcomeText
}

if ($Configs.Theme -eq "light") {
    $ConsoleColorOverrides = @{
        Number = 'DarkGray'
        Member = 'DarkGray'
    }

    Set-PSReadLineOption -Colors $ConsoleColorOverrides
}

Import-Module -Name $PSModuleFolder\New-Symlink.psm1
Import-Module -Name $PSModuleFolder\library.psm1
Import-Module -Name $PSModuleFolder\Format-PowerShellFile.psm1
Import-Module -Name $PSModuleFolder\Search-Google.psm1
Import-Module -Name $PSModuleFolder\Show-Calendar.psm1
Import-Module -Name $PSModuleFolder\Push-GitTag.psm1
Import-Module -Name $PSModuleFolder\Get-EnvironmentVariables.psm1
Import-Module -Name $PSModuleFolder\Prune-LocalBranch.psm1 -DisableNameChecking
Import-Module -Name $PSModuleFolder\Open-GitHubRepository.psm1
Import-Module -Name $PSModuleFolder\Open-GitHubRepository2.psm1
Import-Module -Name $PSModuleFolder\Get-Colors.psm1
Import-Module -Name $PSModuleFolder\Get-FreeDiskSpace.psm1
Import-Module -Name $PSModuleFolder\Amalgamate-Search.psm1 -DisableNameChecking
Import-Module -Name $PSModuleFolder\Open-GenAI.psm1
Import-Module -Name $PSModuleFolder\Show-MultiplicationTable.psm1

Set-Alias -Name ln -Value New-Symlink
Set-Alias -Name np -Value notepad.exe
Set-Alias -Name exp -Value explorer.exe
Set-Alias -Name google -Value Search-Google
Set-Alias -Name envs -Value Get-EnvironmentVariables # 'env' conflicts with scoop install script
Set-Alias -Name goto -Value Switch-Location
Set-Alias -Name gh -Value Open-GitHubRepository
Set-Alias -Name g -Value Open-GitHubRepository2
Set-Alias -Name colors -Value Show-Colors
Set-Alias -Name ".." -Value Switch-PreviousLocation
Set-Alias -Name s -Value Amalgamate-Search
Set-Alias -Name gen -Value Open-GenAI

function reason {
    Write-Host The Solar Council has neutralised your intent to break the rules.
}

function ip {
    (Invoke-WebRequest ifconfig.me).Content
}

function weather {
    (Invoke-WebRequest wttr.in).Content
}

function skyline {
    (Invoke-WebRequest skyline.github.com).Content
}

function mkcd {
    $DirPath = $args[0]
    mkdir -p $DirPath
    Set-Location $DirPath
}

function refresh {
    # preceding . to indicate execution of file
    .$PSScriptFolder\refresh.ps1
}

function google2 {
    Search-GoogleSession -Prompt "google> "
}

function ... {
    Switch-PreviousLocation -Levels 2
}

function .... {
    Switch-PreviousLocation -Levels 3
}

function :q {
    exit
}

function now {
    Get-Date (Get-Date).ToUniversalTime() -UFormat '+%Y-%m-%dT%H:%M:%S.000Z'
}

$ENV:STARSHIP_CONFIG = "$HOME/.config/starship.toml"
$ENV:STARSHIP_CACHE = "$HOME/AppData/Local/Temp" # logging

# Start Starship
Invoke-Expression (&starship init powershell)
