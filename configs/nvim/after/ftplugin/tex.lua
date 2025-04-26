PrintCurrentFileName()

-- Vimtex configuration
vim.g.vimtex_view_method = "zathura" -- change as needed: 'zathura', 'skim', 'sioyek', etc.
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_syntax_enabled = 0      -- disable vimtex syntax, use Tree-sitter instead
vim.opt_local.conceallevel = 2


-- Editor configuration
vim.opt.foldmethod = 'expr'
vim.opt_local.foldexpr = "vimtex#fold#level(v:lnum)"
vim.opt_local.foldlevel = 99      -- Start with all folds open
vim.opt_local.foldenable = true   -- Enable folding by default

-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-cool-snippets" } })
-- TODO: Replace everything with snipmate!
require("luasnip.loaders.from_snipmate").lazy_load()
