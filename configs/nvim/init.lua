require("configs")
require("style")
vim.g.mapleader = ','

require("plugins")
print("Hello from init.lua")


-- Temporary place for keymaps
-- Files navigation
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<C-f>', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<C-g>', require('telescope.builtin').git_files, { desc = '[S]earch [G]uffers [F]iles' })

-- Git navigation
vim.keymap.set('n', '<leader>gs', "<cmd>Git<cr>", { silent = true })
vim.keymap.set('n', '<leader>gl', "<cmd>GV<cr>", { silent = true })

-- Others
vim.keymap.set('n', '<leader>h', "<cmd>noh<cr>", { silent = true })
vim.keymap.set('n', '<leader>r', require('telescope.builtin').live_grep, { desc = '[G]rep [S]trings' })
