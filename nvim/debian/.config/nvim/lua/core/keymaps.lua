-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Vimrc shortcut
vim.keymap.set('', '<leader>e', ':e $MYVIMRC<cr>')
vim.keymap.set('', '<leader>s', ':source $MYVIMRC<cr>')

-- Exit
vim.keymap.set('i', 'jj', '<esc>')

-- Search
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Clipboard I/O
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')

-- Discard contents in 'x' operation
vim.keymap.set({'n', 'x'}, 'x', '"_x')

-- Select all text in current buffer
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- Window navigation
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- Select whole paragraph
vim.keymap.set('n', '<space><space>', 'vip')

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
