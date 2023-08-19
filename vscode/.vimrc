" Key mappings for VSCode Vim Extension

inoremap jj <esc>
nnoremap Y y$

" Center when jumping n/N
nnoremap n nzz
nnoremap N Nzz

" Line wrap movements
nnoremap k gk
nnoremap j gj

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
