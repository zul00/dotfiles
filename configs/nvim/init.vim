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
require('debugger')
require('gitsigns').setup()

require("zk").setup()
require("telescope").load_extension("zk")
EOF
