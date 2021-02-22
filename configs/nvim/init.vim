set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "rust" },  -- list of language that will be disabled
    },
    }
EOF
"
" lua <<EOF
"
set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" LSP config
lua << EOF
local lspconfig = require'lspconfig'

require('lspconfig').ccls.setup{
    on_attach=require'completion'.on_attach;
    root_dir = lspconfig.util.root_pattern(".ccls");
    init_options = { cache = { directory= ".ccls-cache"; } }
}

require('lspconfig').tsserver.setup{
    on_attach=require'completion'.on_attach;
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- disable virtual text
      virtual_text = false,

      -- show signs
      signs = true,

      -- delay update diagnostics
      update_in_insert = false,
      -- display_diagnostic_autocmds = { "InsertLeave" },

    }
  )

require('lspconfig').jedi_language_server.setup{}
require('lspconfig').pyls.setup{}
EOF
