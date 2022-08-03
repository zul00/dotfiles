print("Hello from style.lua")

-- Theme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd [[colorscheme gruvbox]]

-- Formatting
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.autoindent = true
vim.o.smarttab = true
