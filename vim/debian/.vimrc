let mapleader=" "

let g:netrw_isopen = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:newrw_winsize = 20

function! OpenToRight()
    :normal v
    let g:path=expand('%:p')
    echo g:path
    :q!
    execute 'belowright vnew' g:path
    :normal <C-l>
endfunction

function! OpenBelow()
    :normal v
    let g:path=expand('%:p')
    :q!
    execute 'belowright new' g:path
    :normal <C-l>
endfunction

function! NetrwMappings()
    " Hack fix to make ctrl-l work properly
    noremap <buffer> <C-l> <C-w>l
    noremap <silent> <C-n> :call ToggleNetrw()<cr>
    noremap <buffer> V :call OpenToRight()<cr>
    noremap <buffer> H :call OpenBelow()<cr>
endfunction

augroup netrw_mappings
    autocmd!
    autocmd filetype netrw call NetrwMappings()
augroup END

function! ToggleNetrw()
    if g:netrw_isopen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:netrw_isopen=0
    else
        let g:netrw_isopen=1
        silent Lexplore
    endif
endfunction

noremap <c-b> <esc>:Lex<cr>:vertical resize 30<cr>
