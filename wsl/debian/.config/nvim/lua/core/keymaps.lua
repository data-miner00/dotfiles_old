-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Vimrc shortcut
vim.keymap.set('', '<leader>E', ':e $MYVIMRC<cr>')
vim.keymap.set('', '<leader>S', ':source %<cr>')

-- Exit
vim.keymap.set('i', 'jj', '<esc>')

-- Search
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Half page move
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-d>zz')

-- Clipboard I/O
vim.keymap.set({ 'n', 'x', 'v' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set({ 'n', 'x' }, '<leader>p', '"+p')

-- Discard contents in 'x' operation
vim.keymap.set({ 'n', 'x' }, 'x', '"_x')

-- Discard contents in 'p' operation
vim.keymap.set('x', '<leader>p', '"_dP')

-- Discard contents in 'd' operation
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')

-- Select all text in current buffer
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- Window navigation
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- Select whole paragraph
vim.keymap.set('n', '<leader>v', 'vip')

-- Tabs
vim.keymap.set('', '<leader>tt', ':tabnew<cr>')
vim.keymap.set('', '<leader>te', ':tabedit<cr>')
vim.keymap.set('', '<leader>tc', ':tabclose<cr>')
vim.keymap.set('', '<leader>to', ':tabonly<cr>')
vim.keymap.set('', '<leader>tn', ':tabnext<cr>')
vim.keymap.set('', '<leader>tp', ':tabprevious<cr>')
vim.keymap.set('', '<leader>tf', ':tabfirst<cr>')
vim.keymap.set('', '<leader>tl', ':tablast<cr>')
vim.keymap.set('', '<leader>tm', ':tabmove<cr>')
vim.keymap.set('n', '<s-h>', 'gT')
vim.keymap.set('n', '<s-l>', 'gt')

-- Block move
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Better append
vim.keymap.set('n', 'J', 'mzJ`z')

-- Format
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format()
end)

-- Replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
