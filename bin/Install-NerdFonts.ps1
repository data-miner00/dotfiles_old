Param (
    [Parameter(Mandatory=$true, HelpMessage="The font to be installed.")]
    [string]$FontName,

    [Parameter(Mandatory=$false, HelpMessage="The current nerd font version.")]
    [string]$Version = "v3.2.1"

)

$NerdFontUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/$Version/$FontName.zip"
$WorkingFolder = "temp"

if (-not (Test-Path $WorkingFolder)) {
    New-Item -Type Directory -Path $WorkingFolder
}

$DownloadPath = "$WorkingFolder/$FontName.zip"

Invoke-WebRequest -Uri $NerdFontUrl -OutFile $DownloadPath
