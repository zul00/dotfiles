PrintCurrentFileName()

local nnoremap = require("remap").nnoremap

nnoremap('<C-s>', '<cmd>Telescope neorg switch_workspace<CR>', { silent = true })
nnoremap('<C-h>', '<cmd>Telescope neorg find_linkable<CR>', { silent = true })

-- Conceal URL
vim.o.conceallevel=2
