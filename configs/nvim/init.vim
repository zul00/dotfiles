set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua << EOF
-- lua configurations
require('lsp')
require('treesitter')
require('statusline')
require('telescope-config')
require('neorg-config')
EOF
