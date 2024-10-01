function Prune-LocalBranch {
    [CmdletBinding(ConfirmImpact = 'High', SupportsShouldProcess)]
    Param (
        [Parameter(Mandatory=$false, HelpMessage="The name of the default branch so that it will not be deleted")]
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
            git branch -D @(git branch | Select-String -NotMatch $DefaultBranchName | ForEach-Object {$_.Line.Trim()})
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