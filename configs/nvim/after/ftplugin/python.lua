PrintCurrentFileName()

vim.opt.textwidth = 80

-- DAP
-- FIXME: There should be a definition for this path right???
require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
