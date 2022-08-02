require("configs")
require("style")
vim.g.mapleader = ','

require("plugins")
print("Hello from init.lua")


vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>g', "<cmd>Git<cr>", { silent = true })
vim.keymap.set('n', '<leader>gl', "<cmd>GV<cr>", { silent = true })
vim.keymap.set('n', '<leader>h', "<cmd>noh<cr>", { silent = true })
