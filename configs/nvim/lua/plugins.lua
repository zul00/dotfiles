-- Bootstrap packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Theme
    use 'ellisonleao/gruvbox.nvim'
    use 'feline-nvim/feline.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- Git good
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'shumphrey/fugitive-gitlab.vim'
    use 'tommcdo/vim-fubitive'
    use 'junegunn/gv.vim'
    use { 'sindrets/diffview.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- tpope's
    use 'tpope/vim-surround'
    use 'tpope/vim-vinegar'
    use 'tpope/vim-dispatch'
    use 'tpope/vim-repeat'
    use 'tpope/vim-commentary'
    use 'tpope/vim-unimpaired'
    use 'tpope/vim-eunuch'

    -- Fuzzy Finder (files, lsp, etc)
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }
    use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if is_bootstrap then
        require('packer').sync()
    end
end)
-- stylua: ignore end
