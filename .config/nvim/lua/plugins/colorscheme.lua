return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local latte = "latte"
    local mocha = "mocha"
    local frappe = "frappe"
    local macchiato = "macchiato"

    require("catppuccin").setup({
      flavour = latte,
      color_overrides = {
        latte = {
          blue = "#eba0ac",
          surface0 = "#eeeeee",
        },
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
