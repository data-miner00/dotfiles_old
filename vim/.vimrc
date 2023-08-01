" Enable file type detection
filetype on

" Enable plugins and load plugin for detected file type
filetype plugin on

" Load an indent file for the detected file type
filetype indent on

" Turn syntax highlighting on.
syntax on

" Set line number
set number

" Set relative number
set relativenumber

" Set tab width
set tabstop=4

" Set shift width
set shiftwidth=4

" Set autoindent
set autoindent

" Set clickable mouse
set mouse=a

" Highlight cursor line underneath the cursor horizontally
set cursorline

" Highlight cursor line underneath the cursor vertically
set cursorcolumn

" Use space instead of tab
set expandtab

" Don't let cursor scroll off N lines from screen when scrolling
set scrolloff=10

" No wrap
set nowrap

" Highlight matching characters while searching through files
set incsearch

" Ignore case while searching
set ignorecase

" Search specifically for capital letters
" set smartcase

" Show partial command typed in the last line of screen
set showcmd

" Show mode on the last line
set showmode

" Show matching words during a search
set showmatch

" Use highlight when performing search
set hlsearch

" Set the command to save in history (default=20)
set history=40

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

    Plug 'dense-analysis/ale'
    Plug 'whatyouhide/vim-gotham'
    Plug 'preservim/nerdtree'

call plug#end()

" }}}


" MAPPINGS --------------------------------------------------------------- {{{

inoremap jj <esc>

" Set the backslash as leader key
let mapleader = "\\"

" Press \\ to jump back to last cursor position
nnoremap <leader>\ ``

" Press space bar to type colon in command mode
nnoremap <space> :

" Center cursor vertically when searching through words
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line
nnoremap Y y$

" Run python3 file with F5
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" Split window or navigating window
" Split bottom
nnoremap <c-j> <c-w>j

" Split top
nnoremap <c-k> <c-w>k

" Split left
nnoremap <c-h> <c-w>h

" Split right
nnoremap <c-l> <c-w>l

" Resize window using arrow keys
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><

" NERDTree specific mappings
" F3 to toggle NerdTree
nnoremap <f3> :NERDTreeToggle<cr>

" Nerdtree ignore files and directories
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Enable the marker method of folding
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Set indentation 2 spaces for HTML
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" Enable undofile after save for vim 7.3+
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=1000
endif

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded
set statusline=

" Left align status line
set statusline+=\ %F\ %M\ %Y\ %R

" Use divider to separate left and right side
set statusline+=%=

" Status line right side
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show status on second to last line
set laststatus=2

" }}}

" Set color scheme
colorscheme gotham256
