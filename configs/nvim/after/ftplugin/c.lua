PrintCurrentFileName()

local nnoremap = require("remap").nnoremap

nnoremap('<F4>', '<cmd>LspClangdSwitchSourceHeader<CR>', { silent = true, desc = '[S]witch Header or Source' })
nnoremap('f<CR>', '<cmd>Make flash<CR>', { silent = true, desc = '[F]lash' })
