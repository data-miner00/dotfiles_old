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
      flavour = macchiato,
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
