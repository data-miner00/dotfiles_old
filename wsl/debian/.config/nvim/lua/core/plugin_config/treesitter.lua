local languages = {
  "c",
  "lua",
  "rust",
  "haskell",
  "vim",
  "vimdoc",
  "python",
  "clojure",
  "tsx",
  "cpp",
  "go",
  "html",
  "javascript",
}

require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all"
  ensure_installed = languages,

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true, disable = { "yaml" } },
  modules = {},
  ignore_install = {},
})
