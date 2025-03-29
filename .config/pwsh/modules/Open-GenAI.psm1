<#
.SYNOPSIS
    Opens a GenAI (LLM) website.

.DESCRIPTION
    Able to select which GenAI website to open.

.PARAMETER $provider
    The GenAI provider. Defaults to `chatgpt`. Other available options are `gemini`, `claude`, `copilot`, `deepseek`, `perplexity` and `grok`.

.PARAMETER $random
    Ignores the `$provider` parameter and opens a random GenAI provider.

.EXAMPLE
    gen chatgpt

.EXAMPLE
    gen -Random
#>
function Open-GenAI {
    param (
        [Parameter(Mandatory = $false)]
        [ValidateSet("chatgpt", "gemini", "claude", "copilot", "deepseek", "perplexity", "grok")]
        [string]$provider = "chatgpt",

        [Parameter(Mandatory = $false)]
        [Alias("r")]
        [switch]$random
    )

    $Providers = @{
        "chatgpt"    = "https://chatgpt.com"
        "gemini"     = "https://gemini.google.com/app"
        "claude"     = "https://claude.ai/new"
        "copilot"    = "https://copilot.microsoft.com"
        "deepseek"   = "https://chat.deepseek.com"
        "perplexity" = "https://www.perplexity.ai"
        "grok"       = "https://x.com/i/grok"
    }

    if ($random) {
        $values = $Providers.GetType().GetProperty('Values').GetValue($Providers)
        $randomProvider = $values | Out-String -Stream | Get-Random
        Start-Process $randomProvider
        return
    }

    Start-Process $Providers[$provider]
}

Export-ModuleMember -Function Open-GenAI

