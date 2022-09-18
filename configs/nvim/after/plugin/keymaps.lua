local Remap = require("remap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap

-- Navigation + Telescope
nnoremap('<leader>t', '<cmd>Telescope<CR>', { silent = true, desc = '[T]elescope' })
nnoremap('<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
nnoremap('<C-f>', require('telescope.builtin').buffers, { desc = '[F]ind existing [B]uffers' })
nnoremap('<C-g>', "<cmd> lua require('telescope.builtin').git_files({recurse_submodules=true})<CR>", { desc = '[S]earch [G]it [F]iles' })
nnoremap('<C-b>', require('telescope.builtin').current_buffer_fuzzy_find, { desc = '[S]earch in [C]urrent [B]uffers' })
nnoremap('<leader>gr', require('telescope.builtin').live_grep, { silent = true, desc = '[G]rep [S]trings' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- Git navigation
nnoremap('<leader>gs', "<cmd>Git<cr>", { silent = true })
nnoremap('<leader>gw', "<cmd>Git write<cr>", { silent = true })
nnoremap('<leader>gl', "<cmd>GV --all<cr>", { silent = true })
nnoremap('<leader>gd', "<cmd>Gvdiffsplit<cr>", { silent = true })
nnoremap('<leader>go', ":DiffviewOpen ", { silent = true })
nnoremap('<leader>gc', "<cmd>DiffviewClose<cr>", { silent = true })

-- Manage nvim
nnoremap('<leader>so', "<cmd>so<cr>", { silent = true })

-- Diffs
nnoremap('<leader>dt', "<cmd>diffthis<CR>", { silent = true })
nnoremap('<leader>db', "<cmd>windo diffthis<CR>", { silent = true })
nnoremap('<leader>do', "<cmd>diffoff!<CR>", { silent = true })
vnoremap('<leader>dg', "<cmd>diffget<CR>", { silent = true })
vnoremap('<leader>dp', "<cmd>diffput<CR>", { silent = true })
nnoremap('<leader>du', "<cmd>diffu<CR>", { silent = true })
nnoremap('<leader>di', ":set diffopt+=iwhite<CR>", { silent = false })
nnoremap('<leader>dI', ":set diffopt-=iwhite<CR>", { silent = false })

-- TODO: Remove when neovim fixed the issue:
-- https://github.com/folke/todo-comments.nvim/issues/73
inoremap('<C-c>', "<Esc>", { silent = true })

-- Harpoons
nnoremap('<leader>ha', require("harpoon.mark").add_file, { silent = true })
nnoremap('<leader>hl', require("harpoon.ui").toggle_quick_menu, { silent = true })


-- Others
nnoremap('<leader>h', "<cmd>noh<cr>", { silent = true })
nnoremap('<F11>', "<cmd>TagbarToggle<CR>", { silent = true, desc = '[T]oggle [T]agbar' })
nnoremap('<leader>q', '<cmd>q<CR>', { silent = true, desc = '[S]ave and [Q]uit' })

nnoremap('<F5>',  "<Cmd>lua require'dap'.continue()<CR>", { silent = true})
nnoremap('<F6>', "<Cmd>lua require'dap'.step_over()<CR>", { silent = true})
nnoremap('<F7>', "<Cmd>lua require'dap'.step_into()<CR>", { silent = true})
nnoremap('<F8>', "<Cmd>lua require'dap'.step_out()<CR>", { silent = true})
nnoremap('<Leader>b',  "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true})
nnoremap('<Leader>B',  "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { silent = true})
nnoremap('<Leader>lp', "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { silent = true})
nnoremap('<Leader>dr', "<Cmd>lua require'dap'.repl.open()<CR>", { silent = true})
nnoremap('<Leader>dl', "<Cmd>lua require'dap'.run_last()<CR>", { silent = true})

local function toggle_quickfix()
    for _, buf_id in ipairs(vim.api.nvim_eval('tabpagebuflist()')) do
        if (vim.api.nvim_eval('bufname(' .. buf_id .. ')')) == "" then
            vim.cmd [[cclose]]
            return
        end
    end
    vim.cmd [[copen]]
end

vim.keymap.set('n', '<leader><leader>', toggle_quickfix, { silent = true, desc = '[T]oggle [Q]uickfix' })
