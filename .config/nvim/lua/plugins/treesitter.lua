return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = require("user.languages").parser,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
