<#
Variables used for configuring my PowerShell profile.
#>

@{
    GitHubUsername = "data-miner00"
    WelcomeText = "Howdy folks!"
    EnableWelcomeText = $false
    Theme = "light"

    Scoop = @{
        Buckets = @(
            "main",
            "extras"
        )

        Packages = @(
            "starship",
            "neovim",
            "neofetch",
            "just",
            "erlang",
            "gleam",
            "stylua",
            "wezterm",
            "cmake",
            "make",
            "fastfetch",
            "windirstat",
            "zig",
            "bun", # requires "vcredist2022"
            "uv"
        )
    }
}