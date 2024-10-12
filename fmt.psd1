@{
    IncludeRules = @("PSPlaceOpenBrace", "PSUseConsistentIndentation")
    Rules = @{
        PSPlaceOpenBrace = @{
            Enable = $true
            OnSameLine = $false
        }
        PSUseConsistentIndentation = @{
            Enable = $true
            IndentationSize = 4
            PipelineIndentation = 'IncreaseIndentationAfterEveryPipeline'
            Kind = 'space'
        }
    }
}