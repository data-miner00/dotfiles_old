function RGBToHex {
    param (
        [Parameter(Mandatory=$true, Position=0, HelpMessage="The red value")]
        [int]$Red,

        [Parameter(Mandatory=$true, Position=1, HelpMessage="The green value")]
        [int]$Green,

        [Parameter(Mandatory=$true, Position=2, HelpMessage="The blue value")]
        [int]$Blue
    )

    return ("#{0:X2}{1:X2}{2:X2}" -f $Red, $Green, $Blue)
}

function HexToRGB {
    param (
        [Parameter(Mandatory=$true, HelpMessage="The hex value")]
        [string]$Hex,

        [Parameter(Mandatory=$false, HelpMessage="Whether to print it in CSS")]
        [switch]$Css = $false
    )

    $Hex = $Hex -replace "#", ""
    
    if ($Css) {
        return "rgb($([Convert]::ToInt32($Hex.Substring(0, 2), 16)), $([Convert]::ToInt32($Hex.Substring(2, 2), 16)), $([Convert]::ToInt32($Hex.Substring(4, 2), 16)))"
    }
    else {
        [PSCustomObject]@{
            Red = [Convert]::ToInt32($Hex.Substring(0, 2), 16)
            Green = [Convert]::ToInt32($Hex.Substring(2, 2), 16)
            Blue = [Convert]::ToInt32($Hex.Substring(4, 2), 16)
        }
    }
}

Export-ModuleMember -Function RGBToHex, HexToRGB