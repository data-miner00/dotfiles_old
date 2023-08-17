" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

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

" Show cursor position
set ruler

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

" Intuitive backspacing
set backspace=indent,eol,start

" Menu for file paths when `:e` or `:b`
set wildmenu

" Don't update screen during macro and script execution
set lazyredraw

" Disable beep when error
set noerrorbells

" Flash the screen on error
" set visualbell

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

    Plug 'dense-analysis/ale'
    Plug 'whatyouhide/vim-gotham'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-surround'
    Plug 'jlanzarotta/bufexplorer'

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

" Navigating window
" Switch to bottom window
nnoremap <c-j> <c-w>j

" Switch to top window
nnoremap <c-k> <c-w>k

" Switch to left window
nnoremap <c-h> <c-w>h

" Switch to right window
nnoremap <c-l> <c-w>l

" Resize window using arrow keys
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w>>
nnoremap <c-right> <c-w><

" Autoclosing
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap (<CR> (<CR>)<ESC>O<Tab>
inoremap [ []<left>
inoremap [<CR> [<CR>]<ESC>O<Tab>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O<Tab>
inoremap {;<CR> {<CR>};<ESC>O<Tab>

" Vimrc file bindings
map <Leader>E :e $MYVIMRC<CR>
map <Leader>S :source $MYVIMRC<CR>

" Line wrap movements
nnoremap k gk
nnoremap j gj

" Select whole paragraph
nnoremap <space><space> vip

" Tab indenting
nnoremap <tab> >>
nnoremap <s-tab> <<
xnoremap <tab> >gv
xnoremap <s-tab> <gv

" Tab mappings
map <leader>tt :tabnew<cr>
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove
nnoremap <s-h> gT
nnoremap <s-l> gt

" Casing
map! <leader>f <esc>gUiw']a
map! <leader>ff <esc>guiw']a

" Abbreviations
iab fn function
ab teh the

" NERDTree specific mappings
" F3 to toggle NerdTree
nnoremap <f3> :NERDTreeToggle<cr>

" Nerdtree ignore files and directories
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" Bufexplorer show relative path instead of absolute path
" let g:bufExplorerShowRelativePath=1

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

" Automatic fold settings for specific files
autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css setlocal foldmethod=indent shiftwidth=2 tabstop=2

" Enable undofile after save for vim 7.3+
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=1000
endif

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|     PlugInstall --sync | q
  \| endif

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
