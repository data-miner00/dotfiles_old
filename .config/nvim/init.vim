try
  source ~/.config/nvim/lua/user/settings.vim
catch
  " No such file? No problem; just ignore it.
endtry

lua << EOF
require("user.keymaps")
require("user.lazy-setup")
EOF
