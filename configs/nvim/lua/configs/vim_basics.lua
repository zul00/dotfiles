-- Formatting
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.autoindent = true
vim.o.smarttab = true

-- Search
vim.o.hlsearch = true
vim.o.incsearch = true

-- Mouse
vim.o.mouse = 'a'

-- Save undo history
vim.o.undofile = true
vim.o.undodir = '/tmp'
vim.o.swapfile = false

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Show trailing space
vim.o.list = true

-- Switch buffer behavior, enable autowrite
vim.o.autowrite = true
vim.o.autoread = true

-- Numbering
vim.o.number = true
vim.o.relativenumber = true

-- Others
vim.g['netrw_liststyle'] = 3
vim.o.scrolloff = 2
vim.cmd [[set clipboard+=unnamedplus]]

-- Diff behavior
vim.opt.diffopt:append({'followwrap'})
