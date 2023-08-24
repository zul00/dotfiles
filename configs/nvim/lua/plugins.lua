local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


-- Example using a list of specs with the default options
vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = ','

local plugins = {
    -- "folke/which-key.nvim",
    -- { "folke/neoconf.nvim", cmd = "Neoconf" },
    -- "folke/neodev.nvim",

    -- Theme
    { 'ellisonleao/gruvbox.nvim' },
    { 'feline-nvim/feline.nvim', lazy = false },
    { 'kyazdani42/nvim-web-devicons' },
    { 'folke/todo-comments.nvim' },
    { 'rcarriga/nvim-notify' },
    { "catppuccin/nvim" },

    -- Git good
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-rhubarb' },
    { 'shumphrey/fugitive-gitlab.vim' },
    { 'tommcdo/vim-fubitive' },
    { 'junegunn/gv.vim' },
    { 'sindrets/diffview.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-lua/plenary.nvim' },

    -- tpope's
    { 'tpope/vim-surround' },
    { 'tpope/vim-vinegar' },
    { 'tpope/vim-dispatch' },
    { 'tpope/vim-repeat' },
    { 'tpope/vim-commentary' },
    { 'tpope/vim-unimpaired' },
    { 'tpope/vim-eunuch' },

    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- Navigation
    { 'ThePrimeagen/harpoon' },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'nvim-treesitter/nvim-treesitter-context' },

    -- LSP
    -- TODO: { lsp-zero {https://www.youtube.com/watch?v=w7i4amO_zaE&t=1001s}
    { 'j-hui/fidget.nvim', tag = 'legacy' },
    { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', },
            { 'williamboman/mason-lspconfig.nvim', },

            -- Useful status updates for LSP

            -- Additional lua configuration, makes nvim stuff amazing
            { 'folke/lsp-colors.nvim', },
            { 'folke/lsp-trouble.nvim', },
        }
    },

    -- DAP
    { 'mfussenegger/nvim-dap' },
    { 'mfussenegger/nvim-dap-python' },
    { 'rcarriga/nvim-dap-ui' },

    -- Completions
    { 'hrsh7th/nvim-cmp', dependencies = { 'hrsh7th/cmp-nvim-lsp' } },
    { 'L3MON4D3/LuaSnip', dependencies = { 'saadparwaiz1/cmp_luasnip' } },
    { "rafamadriz/friendly-snippets" },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'petertriho/cmp-git' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },

    -- Tools
    { 'wakatime/vim-wakatime' },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'majutsushi/tagbar' },
    { 'folke/zen-mode.nvim' },
    { 'embear/vim-localvimrc' },
    { 'mbbill/undotree' },
    { 'whleucka/reverb.nvim' },

    -- Neorg
    { 'nvim-neorg/neorg' },
    { 'nvim-neorg/neorg-telescope' },

    -- Type specific plugins
    -- LaTeX
    { 'lervag/vimtex' }
}

require("lazy").setup(plugins)
