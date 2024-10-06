local toggler = require("alternate-toggler")

toggler.setup({
  alternates = {
    ["=="] = "!=",
  },
})

vim.keymap.set("n", "<leader>ta", toggler.toggleAlternate)
