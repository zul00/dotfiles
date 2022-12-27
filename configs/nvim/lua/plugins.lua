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
    use 'folke/todo-comments.nvim'
    use 'rcarriga/nvim-notify'
    use { "catppuccin/nvim", as = "catppuccin" }

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

    -- Navigation
    use 'ThePrimeagen/harpoon'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-context'

    -- LSP
    -- TODO: Use lsp-zero {https://www.youtube.com/watch?v=w7i4amO_zaE&t=1001s}
    use { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',

            -- Additional lua configuration, makes nvim stuff amazing
            'folke/lsp-colors.nvim',
            'folke/lsp-trouble.nvim',
        },
    }

    -- DAP
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use 'rcarriga/nvim-dap-ui'

    -- Completions
    use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }
    use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }
    use "rafamadriz/friendly-snippets"
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'petertriho/cmp-git'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'

    -- Tools
    use 'wakatime/vim-wakatime'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'majutsushi/tagbar'
    use 'folke/zen-mode.nvim'
    use 'embear/vim-localvimrc'

    -- Neorg
    use 'nvim-neorg/neorg'
    use 'nvim-neorg/neorg-telescope'

    -- Type specific plugins
    -- LaTeX
    use 'lervag/vimtex'
    -- Markdown
    -- install without yarn or npm
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    -- Ledger
    use 'ledger/vim-ledger'
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if is_bootstrap then
        require('packer').sync()
    end
end)
-- stylua: ignore end
