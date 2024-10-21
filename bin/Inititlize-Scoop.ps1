Param (
    [Parameter(Mandatory=$true, HelpMessage="The buckets to be added.")]
    [string[]]$Buckets,

    [Parameter(Mandatory=$true, HelpMessage="The packages to be installed")]
    [string[]]$Package
)

$ErrorActionPreference = "Stop"

foreach ($Bucket in $Buckets) {
    scoop bucket add $Bucket
}

foreach ($Package in $Packages) {
    scoop install $Package
}