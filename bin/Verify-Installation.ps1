
$IsGitInstalled = if ($(git --version)) { "installed" } else { "not installed" }
Write-Host Git is $IsGitInstalled

$IsVscodeInstalled = if($(code --version)) { "installed" } else { "not installed" }
Write-Host VSCode is $IsVscodeInstalled

$InstalledPrograms = (Get-WmiObject -Class Win32_Product | Select-Object -Property Name | Sort-Object -Property Name).Name

$InstalledPrograms.Contains("Neovim")
