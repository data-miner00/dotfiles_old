return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "catppuccin",
        section_separators = { left = "", right = "" },
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
  end,
}
