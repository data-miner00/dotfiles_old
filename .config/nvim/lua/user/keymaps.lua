-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Vimrc shortcut
vim.keymap.set(
  "",
  "<leader>E",
  ":e $MYVIMRC<cr>",
  { desc = "[P]Open up the config file for editing" }
)
vim.keymap.set(
  "",
  "<leader>S",
  ":source %<cr>",
  { desc = "[P]Reload the edited config file in current session" }
)

-- Line wrap
vim.keymap.set(
  "n",
  "<leader>lw",
  "<cmd>set wrap!<CR>",
  { desc = "[P]Toggle line wrap" }
)

-- Exit
vim.keymap.set("i", "jj", "<esc>", { desc = "[P]Exit insert mode" })

-- Search
vim.keymap.set(
  "n",
  "<leader>h",
  ":nohlsearch<CR>",
  { desc = "[P]Unhighlight the search results" }
)
vim.keymap.set(
  "n",
  "n",
  "nzz",
  { desc = "[P]Go to the next search result and center it" }
)
vim.keymap.set(
  "n",
  "N",
  "Nzz",
  { desc = "[P]Go to the previous search result and center it" }
)

-- Half page move
vim.keymap.set(
  "n",
  "<C-d>",
  "<C-d>zz",
  { desc = "[P]Move down half a page and center it" }
)
vim.keymap.set(
  "n",
  "<C-u>",
  "<C-u>zz",
  { desc = "[P]Move up half a page and center it" }
)

-- Clipboard I/O
vim.keymap.set(
  { "n", "x", "v" },
  "<leader>y",
  '"+y',
  { desc = "[P]Copy the text to clipboard" }
)
vim.keymap.set(
  "n",
  "<leader>Y",
  '"+Y',
  { desc = "[P]Copy the text to the end of line to clipboard" }
)
vim.keymap.set(
  { "n", "x" },
  "<leader>p",
  '"+p',
  { desc = "[P]Paste the content from clipboard" }
)

-- Discard contents in 'x' operation
vim.keymap.set(
  { "n", "x" },
  "x",
  '"_x',
  { desc = "[P]Discard single character into void register" }
)

-- Discard contents in 'p' operation
vim.keymap.set(
  "x",
  "<leader>p",
  '"_dP',
  { desc = "[P]Discard replaced content into void register" }
)

-- Discard contents in 'd' operation
vim.keymap.set(
  { "n", "v" },
  "<leader>d",
  '"_d',
  { desc = "[P]Discard deleted(cut) content into void register" }
)

-- Select all text in current buffer
vim.keymap.set(
  "n",
  "<leader>a",
  ":keepjumps normal! ggVG<cr>",
  { desc = "[P]Select all text in the buffer" }
)

-- Window navigation
vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "[P]Focus window to the left" })
vim.keymap.set(
  "n",
  "<c-j>",
  "<c-w>j",
  { desc = "[P]Focus window to the bottom" }
)
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "[P]Focus window to the top" })
vim.keymap.set(
  "n",
  "<c-l>",
  "<c-w>l",
  { desc = "[P]Focus window to the right" }
)

-- Select whole paragraph
vim.keymap.set(
  "n",
  "<leader>v",
  "vip",
  { desc = "[P]Select the whole paragraph" }
)

-- Tabs
vim.keymap.set("", "<leader>tt", ":tabnew<cr>")
vim.keymap.set("", "<leader>te", ":tabedit<cr>")
vim.keymap.set("", "<leader>tc", ":tabclose<cr>")
vim.keymap.set("", "<leader>to", ":tabonly<cr>")
vim.keymap.set("", "<leader>tn", ":tabnext<cr>")
vim.keymap.set("", "<leader>tp", ":tabprevious<cr>")
vim.keymap.set("", "<leader>tf", ":tabfirst<cr>")
vim.keymap.set("", "<leader>tl", ":tablast<cr>")
vim.keymap.set("", "<leader>tm", ":tabmove<cr>")
vim.keymap.set("n", "<s-h>", "gT")
vim.keymap.set("n", "<s-l>", "gt")

-- Block move
vim.keymap.set(
  "v",
  "J",
  ":m '>+1<CR>gv=gv",
  { desc = "[P]Move the selected block bottom" }
)
vim.keymap.set(
  "v",
  "K",
  ":m '<-2<CR>gv=gv",
  { desc = "[P]Move the selected block top" }
)

-- Better append
vim.keymap.set("n", "J", "mzJ`z", { desc = "[P]Better append of next line" })

-- Format
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end, { desc = "[P]Format the current buffer with available formatters" })

-- Replace
vim.keymap.set(
  "n",
  "<leader>r",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "[P]Replace the word under cursor globally" }
)

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {
  desc = "[P]Mark the current file as executable",
  silent = true,
})

-- Horizontal navigation
vim.keymap.set("n", "<c-s-h>", "20zh")
vim.keymap.set("n", "<c-s-l>", "20zl")

-- Terminal operation
vim.keymap.set(
  "n",
  "<c-o><c-t>",
  ":terminal<cr>",
  { desc = "[P]Open inline terminal" }
)
vim.keymap.set("t", "<c-w>h", "<c-\\><c-n>", { silent = true })
vim.keymap.set(
  "t",
  "<esc>",
  "<c-\\><c-n>",
  { desc = "[P]Return terminal into normal mode" }
)

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", { desc = "[P]Resize up" })
vim.keymap.set("n", "<Down>", ":resize +2<CR>", { desc = "[P]Resize down" })
vim.keymap.set(
  "n",
  "<Left>",
  ":vertical resize -2<CR>",
  { desc = "[P]Resize left" }
)
vim.keymap.set(
  "n",
  "<Right>",
  ":vertical resize +2<CR>",
  { desc = "[P]Resize right" }
)

-- Break the line from the cursor
vim.keymap.set("n", "<enter>", "i<CR><ESC>")

-- Tabbings
vim.keymap.set({ "v", "n" }, "<tab>", ">>")
vim.keymap.set({ "v", "n" }, "<s-tab>", "<<")

-- Pastings
vim.keymap.set(
  "v",
  "p",
  '"_dP',
  { desc = "[P]Paste while keeping last yanked contents" }
)
