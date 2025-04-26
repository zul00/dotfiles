PrintCurrentFileName()

local nnoremap = require("remap").nnoremap

nnoremap('<F4>', '<cmd>e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>', { silent = true, desc = '[H]eader' })
nnoremap('<F4>', '<cmd>e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>', { silent = true, desc = '[H]eader' })
nnoremap('<F5>', '<cmd>Dispatch neon/twtg/tools/sign_image.py  ../../ditto/bootloader/targets/TARGET_DEV/dev_private_20201022.pem<CR>', { silent = true, desc = '[H]eader' })

vim.g.load_doxygen_syntax=1
vim.opt.syntax = "cpp.doxygen"
-- print(vim.inspect(vim.opt.syntax))
