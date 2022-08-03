local Remap = require("remap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

-- Navigation + Telescope
nnoremap('<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
nnoremap('<C-f>', require('telescope.builtin').buffers, { desc = '[F]ind existing [B]uffers' })
nnoremap('<C-g>', require('telescope.builtin').git_files, { desc = '[S]earch [G]uffers [F]iles' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- Git navigation
nnoremap('<leader>gs', "<cmd>Git<cr>", { silent = true })
nnoremap('<leader>gl', "<cmd>GV --all<cr>", { silent = true })
nnoremap('<leader>gd', "<cmd>Gvdiffsplit<cr>", { silent = true })

-- Others
nnoremap('<leader>h', "<cmd>noh<cr>", { silent = true })
nnoremap('<leader>r', require('telescope.builtin').live_grep, { desc = '[G]rep [S]trings' })

-- Manage nvim
nnoremap('<leader>so', "<cmd>so<cr>", { silent = true })

-- Diffs
nnoremap('<leader>dt', "<cmd>diffthis<CR>", { silent = true })
nnoremap('<leader>db', "<cmd>windo diffthis<CR>", { silent = true })
nnoremap('<leader>do', "<cmd>diffoff!<CR>", { silent = true })
vnoremap('<leader>dg', "<cmd>diffget<CR>", { silent = true })
vnoremap('<leader>dp', "<cmd>diffput<CR>", { silent = true })
nnoremap('<leader>du', "<cmd>diffu<CR>", { silent = true })
nnoremap('<leader>di', "<cmd>set diffopt+=iwhite<CR>", { silent = true })
nnoremap('<leader>dI', "<cmd>set diffopt-=iwhite<CR>", { silent = true })
