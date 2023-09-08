-- print("Hello from init.lua")

require("configs.vim_basics")
-- FIXME: This should not be needed!
vim.o.termguicolors = true
require("plugins")
require("configs.theme")

vim.g['localvimrc_sandbox'] = 0
vim.g['localvimrc_whitelist'] = '*/.lvimrc'
require("luasnip.loaders.from_vscode").lazy_load()
-- REVIEW: When treesitter is running, the dark configuration that was set in configs.theme is ignored and needs to be recalled. But if we have the line below, it works fine.
vim.o.background = "dark" -- or "light" for light mode

-- vim.lsp.set_log_level("debug")
