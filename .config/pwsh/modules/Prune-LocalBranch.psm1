<#
.Synopsis
    Prune local and origin branches.
.Description
    Removes unused local branches besides the default branch and cleanup stale origin branches.
    This will occur when practising trunk-based development (https://trunkbaseddevelopment.com/).
    It is annoying to have bunch of stale local/origin branches laying around.
.Parameter DefaultBranchName
    The default branch name on the local to not be removed. Defaults to `master`.
.Example
    # Removes origin and local branches except the default branch
    Prune-LocalBranch
.Example
    # Removes origin and local branches except `main`
    Prune-LocalBranch -DefaultBranchName main
#>
function Prune-LocalBranch {
    [CmdletBinding(ConfirmImpact = 'High', SupportsShouldProcess)]
    Param (
        [Parameter(Mandatory = $false, HelpMessage = "The name of the default branch so that it will not be deleted")]
        [string]$DefaultBranchName = "master"
    )

    begin {
        if (!(Test-Path .git -PathType Container)) {
            throw "The current directory is not a Git directory."
        }
    }

    process {
        git checkout $DefaultBranchName
        Write-Host "Checked out to branch '$DefaultBranchName'"

        if ($PSCmdlet.ShouldProcess("Prune unused local branches")) {
            git branch -D @(git branch | Select-String -NotMatch $DefaultBranchName | ForEach-Object { $_.Line.Trim() })
            Write-Host "Pruned local branches besides '$DefaultBranchName'"
        }

        if ($PSCmdlet.ShouldProcess("Prune stale origin")) {
            git remote prune origin
            Write-Host "Pruned remote origin"
        }
    }

    end {
        $status = if ($Error -ne $null) { "failed" } else { "completed" }
        Write-Host "Prune $status."
    }
}

Export-ModuleMember -Function Prune-LocalBranch

