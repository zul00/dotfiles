print("Hello from tex.lua")

-- Vimtex configuration
vim.g.vimtex_view_method = 'sioyek'
vim.g.vimtex_fold_enabled = 1

-- Editor configuration
vim.opt.foldmethod = 'expr'

-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./my-cool-snippets" } })
-- TODO: Replace everything with snipmate!
require("luasnip.loaders.from_snipmate").lazy_load()
