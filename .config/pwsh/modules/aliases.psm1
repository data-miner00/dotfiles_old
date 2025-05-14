# Git Aliases
function gs { git status }
function ga { git add $args }
function gaa { git add --all }
function gc { git commit -m $args }
function gp { git push }
function gl { git pull }
function gd { git diff $args }
function gb { git branch $args }
function gco { git checkout $args }
function glog { git log --oneline --graph --decorate --all }

function gcp {
    param(
        [Parameter(Mandatory=$true, HelpMessage="The commit message for the changes.")]
        [string]$message
    )

    if ([string]::IsNullOrEmpty($message)) {
        Write-Host "Commit message cannot be empty." -ForegroundColor Red
        return
    }

    git add --all
    git commit -m $message
    git push
    Write-Host "Changes committed and pushed: $message" -ForegroundColor Green
}

