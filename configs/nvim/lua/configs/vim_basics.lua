-- Formatting
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.colorcolumn = "80"

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Mouse
vim.opt.mouse = 'a'

-- Save undo history
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.swapfile = false
vim.opt.backup = false

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Show trailing space
vim.opt.list = true

-- Switch buffer behavior, enable autowrite
vim.opt.autowrite = true
vim.opt.autoread = true

-- Numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Others
vim.g['netrw_liststyle'] = 3
vim.opt.scrolloff = 8
vim.cmd [[set clipboard+=unnamedplus]]

-- Diff behavior
vim.opt.diffopt:append({ 'followwrap' })

-- Localvimrc
vim.g.localvimrc_persistent = 2
