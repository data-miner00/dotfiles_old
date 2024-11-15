" Visual line navigation
nmap j gj
nmap k gk

" Front and end
nmap H ^
nmap L $

" Remove search highlights
nmap <F9> :nohl<CR>

imap jj <Esc>

" Surround
exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

" NOTE: must use 'map' and not 'nmap'
map [[ :surround_wiki<CR>
nunmap s
vunmap s
map s" :surround_double_quotes<CR>
map s' :surround_single_quotes<CR>
map s( :surround_brackets<CR>
map s) :surround_brackets<CR>
map s[ :surround_square_brackets<CR>
map s{ :surround_curly_brackets<CR>
map s} :surround_curly_brackets<CR>

" Yank to system clipboard
set clipboard=unnamed

" Fold
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold<CR>
nmap zc :togglefold<CR>
nmap za :togglefold<CR>

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall<CR>

exmap foldall obcommand editor:fold-all
nmap zM :foldall<CR>

" Tabs
exmap tabnext obcommand workspace:next-tab
nmap gt :tabnext<CR>
exmap tabprev obcommand workspace:previous-tab
nmap gT :tabprev<CR>

" Switch panes
exmap focusLeft obcommand editor:focus-left
exmap focusRight obcommand editor:focus-right
exmap focusBottom obcommand editor:focus-bottom
exmap focusTop obcommand editor:focus-top
nmap <C-w>h :focusLeft<CR>
nmap <C-w>l :focusRight<CR>
nmap <C-w>j :focusBottom<CR>
nmap <C-w>k :focusTop<CR>

" Headings
exmap nextHeading jsfile mdHelpers.js {jumpHeading(true)}
exmap prevHeading jsfile mdHelpers.js {jumpHeading(false)}
nmap ]] :nextHeading<CR>
nmap [[ :prevHeading<CR>

" mapping vs/hs as workspace split
exmap vs obcommand workspace:split-vertical
exmap sp obcommand workspace:split-vertical
exmap hs obcommand workspace:split-horizontal
nmap <C-v> :vs<CR>
nmap <C-s> :hs<CR>

" window controls
exmap wq obcommand workspace:close
exmap q obcommand workspace:close
