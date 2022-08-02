print("from keymaps.lua")

local Remap = require("remap")
local nnoremap = Remap.nnoremap
-- local vnoremap = Remap.vnoremap
-- local inoremap = Remap.inoremap
-- local xnoremap = Remap.xnoremap
-- local nmap = Remap.nmap

-- Files navigation
nnoremap('<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
nnoremap('<C-f>', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
nnoremap('<C-g>', require('telescope.builtin').git_files, { desc = '[S]earch [G]uffers [F]iles' })

-- Git navigation
nnoremap('<leader>gs', "<cmd>Git<cr>", { silent = true })
nnoremap('<leader>gl', "<cmd>GV<cr>", { silent = true })
nnoremap('<leader>gd', "<cmd>Gvdiffsplit<cr>", { silent = true })

-- Others
nnoremap('<leader>h', "<cmd>noh<cr>", { silent = true })
nnoremap('<leader>r', require('telescope.builtin').live_grep, { desc = '[G]rep [S]trings' })

-- Manage nvim
nnoremap('<leader>so', "<cmd>so<cr>", { silent = true })
