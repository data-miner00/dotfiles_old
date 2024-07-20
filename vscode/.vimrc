" Key mappings for VSCode Vim Extension

inoremap jj <esc>
nnoremap Y y$

" Center when jumping n/N
nnoremap n nzz
nnoremap N Nzz

" Line wrap movements
nnoremap k gk
nnoremap j gj

" Add empty line
nnoremap # o<ESC>k

" Tab indenting
nnoremap <tab> >>
nnoremap <s-tab> <<
xnoremap <tab> >gv
xnoremap <s-tab> <gv

" Highlight all
nnoremap <leader>a ggVG

" Clipboard
noremap <leader>p "+p
noremap <leader>y "+y

" Window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Quit, write, cut
nnoremap <leader>w :w!<cr>
nnoremap <leader>qq :q!<cr>
nnoremap <leader>x :x!<cr>

" Editor
nnoremap K editor.action.showHover
nnoremap [d editor.action.marker.prev
nnoremap ]d editor.action.quickFix

" Line edge
nnoremap H ^
nnoremap L $
