# dotfiles

My Windows configuration files.

## Screenshot

Thanks [ChadCat5207](https://www.reddit.com/r/unixporn/comments/1ipddtk/awesome_old_rice_i_never_posted) for the inspiration! I love it!

![Ubuntu WSL](/bin/screenshots/screenshot-1.png)

![Other programs](/bin/screenshots/screenshot-2.png)

## Summary

Here is a summary of the tools I use.

- **WM**: glazeWM
- **Status bar**: zebar
- **Shell**: PowerShell, bash, zsh
- **Prompt**: Starship
- **Terminal**: Windows Terminal, wezterm
- **Font**: CaskaydiaMono Nerd Font
- **Launcher**: PowerToys Run
- **Text editor**: Neovim, Emacs, Notepad++, VS Code, Cursor
- **Fetch**: neofetch, fastfetch
- **IDE**: Visual Studio 2022
- **VM**: VirtualBox, Vagrant
- **Package manager**: Scoop, Chocolatey
- **Browser**: Firefox, Arc
- **Flyout**: Modern Flyout

## Installation

Unfortunately, there are some components/software that needs to be installed manually as of now. I will be striving to automate as much as possible.

> [!NOTE]  
> Installation steps are currently work in progress.

## Vagrant

Validate the syntax for Vagrantfile.

```
vagrant validate
```

## Formatting

1. For Lua, use the `stylua` command against lua-containing folders.

```
stylua .config/nvim
```

2. For Powershell, use the `Format-PowerShellFile` command.

```powershell
Get-ChildItem .\.config\pwsh\modules\ | Where-Object { $_.Mode -eq "-a----" } | ForEach-Object { Format-PowerShellFile ".\.config\pwsh\modules\$_" }Get-ChildItem ".\.config\pwsh\modules" | Select-Object { $_.Name }
```

## License

Distributed under the WTFPL License. See LICENSE for more information.

<br />
<a href="http://www.wtfpl.net/">
  <img src="http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-4.png" width="80" height="15" alt="WTFPL" />
</a>
