<#
.SYNOPSIS
    Opens a GenAI (LLM) website.

.DESCRIPTION
    Able to select which GenAI website to open.

.PARAMETER $provider
    The GenAI provider.

.EXAMPLE
    gen chatgpt
#>
function Open-GenAI {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateSet("chatgpt", "gemini", "claude", "copilot")]
        [string]$provider
    )

    switch ($provider) {
        "chatgpt" {
            Start-Process "https://chatgpt.com"
        }
        "gemini" {
            Start-Process "https://gemini.google.com/app"
        }
        "claude" {
            Start-Process "https://claude.ai/new"
        }
        "copilot" {
            Start-Process "https://copilot.microsoft.com"
        }
    }
}

Export-ModuleMember -Function Open-GenAI