require("configs")
require("plugins")
print("Hello from init.lua")

vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
