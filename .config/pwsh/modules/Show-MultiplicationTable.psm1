<#
.SYNOPSIS
    Displays a multiplication table.

.DESCRIPTION
    Takes an optional max parameter to construct a multiplication table.

.PARAMETER $Max
    The maximum factor for the multiplication table. Defaults to 12.

.EXAMPLE
    Show-MultiplicationTable -Max 12
#>
function Show-MultiplicationTable {
    Param (
        [Parameter(Mandatory = $False)]
        [int]$Max = 12
    )
    
    $padLength = "$($Max * $Max)".Length + 1

    For ($Num = 1; $Num -le $Max; $Num++) {
        For ($Num2 = 1; $Num2 -le $Max; $Num2++) {
            Write-Host -NoNewline "$($Num * $Num2)".PadLeft($padLength, ' ')

            If ($Num2 -eq 1) {
                Write-Host -NoNewline " | "
            }
        }

        If ($Num -eq 1) {
            Write-Host
            Write-Host $("-" * $($padLength * $Max + 3))
        }

        Write-Host
    }
}

Export-ModuleMember -Function Show-MultiplicationTable

