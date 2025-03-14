# Reference: https://stackoverflow.com/questions/5195859/how-do-you-push-a-tag-to-a-remote-repository-using-git
function Push-GitTag {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Version,

        [Parameter(Mandatory = $false)]
        [bool]$UseRecommended = $true,

        [Parameter(Mandatory = $false)]
        [bool]$Force
    )

    if ($(git tag --list) -like "*$Version*") {
        if ($Force -eq $false) {
            throw "The tag '$Version' already exist."
        }
        else {
            Write-Warning "The tag '$Version' exists. Forcing push.."
        }
    }

    git tag $Version

    if ($UseRecommended) {
        git push origin tag $Version
    }
    else {
        # not recommended as this will push all tags
        git push --tags
    }

    Write-Host "Done."
}

Export-ModuleMember -Function Push-GitTag

