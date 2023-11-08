function Clear-LocalBranch {
    git checkout master
    git branch -D  @(git branch | select-string -NotMatch "master" | Foreach {$_.Line.Trim()})
    git remote prune origin
}
