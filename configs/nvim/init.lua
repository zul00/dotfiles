print("Hello from init.lua")

require("configs.vim_basics")
require("plugins")
require("configs.theme")

vim.g['localvimrc_sandbox'] = 0
vim.g['localvimrc_whitelist'] = '*/.lvimrc'
