local M = {}

M.servers = {
  "lua_ls",
  "cssls",
  "ts_ls",
  "jsonls",
  "clangd",
  "rust_analyzer",
  "pyright",
  "zls",
}

M.parsers = {
  "lua",
  "markdown",
  "javascript",
  "typescript",
  "html",
  "css",
  "json",
  "yaml",
}

return M
