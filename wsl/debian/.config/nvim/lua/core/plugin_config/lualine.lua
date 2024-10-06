require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "catppuccin",
  },
  sectuibs = {
    lualine_a = {
      {
        "filename",
        path = 1,
      },
    },
  },
})
