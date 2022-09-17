local nnoremap = require("remap").nnoremap

nnoremap('<F4>', '<cmd>e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>', { silent = true, desc = '[H]eader' })
