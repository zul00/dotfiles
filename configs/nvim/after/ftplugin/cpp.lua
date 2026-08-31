PrintCurrentFileName()

local nnoremap = require("remap").nnoremap

nnoremap('<F4>', '<cmd>LspClangdSwitchSourceHeader<CR>', { silent = true, desc = '[S]witch Header or Source' })
nnoremap('<F5>', '<cmd>Dispatch neon/twtg/tools/sign_image.py  ../../ditto/bootloader/targets/TARGET_DEV/dev_private_20201022.pem<CR>', { silent = true, desc = '[H]eader' })
nnoremap('<leader>f', '<cmd>Make flash<CR>', { silent = true, desc = '[F]lash' })


vim.g.load_doxygen_syntax=1
vim.opt.syntax = "cpp.doxygen"
-- print(vim.inspect(vim.opt.syntax))
