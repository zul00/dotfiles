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

    -- Themes
    { 'ellisonleao/gruvbox.nvim' },
    { 'catppuccin/nvim' },
    { 'nvim-lualine/lualine.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'folke/todo-comments.nvim' },
    { 'rcarriga/nvim-notify' },

    -- Git good
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-rhubarb' },
    { 'shumphrey/fugitive-gitlab.vim' },
    { 'tommcdo/vim-fubitive' },
    { 'rbong/vim-flog' },
    { 'sindrets/diffview.nvim',                   dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'lewis6991/gitsigns.nvim',                  dependencies = { 'nvim-lua/plenary.nvim' } },

    -- tpope's
    { 'tpope/vim-surround' },
    { 'tpope/vim-vinegar' },
    { 'tpope/vim-dispatch' },
    { 'tpope/vim-repeat' },
    { 'tpope/vim-commentary' },
    { 'tpope/vim-unimpaired' },
    { 'tpope/vim-eunuch' },

    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim',            dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- Navigation
    {
        "ThePrimeagen/harpoon",
        -- branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        -- keys = {
        -- {
        --   "<leader>h", {function() require("harpoon"):list():add() end}
        -- },
    },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter",            build = ":TSUpdate" },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'nvim-treesitter/nvim-treesitter-context' },

    -- LSP
    { 'j-hui/fidget.nvim',                          tag = 'legacy' },
    { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'mason-org/mason.nvim', },
            { 'mason-org/mason-lspconfig.nvim', },
            { 'folke/lsp-colors.nvim', },
            { 'folke/lsp-trouble.nvim', },
        }
    },


    -- DAP
    { 'mfussenegger/nvim-dap' },
    { 'mfussenegger/nvim-dap-python' },
    { 'jedrzejboczar/nvim-dap-cortex-debug', dependencies = 'mfussenegger/nvim-dap' },
    { 'rcarriga/nvim-dap-ui',                dependencies = 'nvim-neotest/nvim-nio' },

    -- Completions
    { 'hrsh7th/nvim-cmp',                    dependencies = { 'hrsh7th/cmp-nvim-lsp' } },
    { 'L3MON4D3/LuaSnip',                    dependencies = { 'saadparwaiz1/cmp_luasnip' } },
    { 'rafamadriz/friendly-snippets' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'petertriho/cmp-git' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },

    -- Tools
    { 'wakatime/vim-wakatime' },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",                                 opts = {} },
    { 'majutsushi/tagbar' },
    {
        'folke/zen-mode.nvim',
        opts = {
            plugins = {
                tmux = { enabled = true }, -- disables the tmux statusline
                wezterm = {
                    enabled = false,
                    -- can be either an absolute font size or the number of incremental steps
                    font = "+7", -- (10% increase per step)
                },
            },
        },
    },
    { 'embear/vim-localvimrc' },
    { 'mbbill/undotree' },

    -- Neorg
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- We'd like this plugin to load first out of the rest
        config = true,   -- This automatically runs `require("luarocks-nvim").setup()`
    },
    {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
    },
    { 'nvim-neorg/neorg-telescope' },

    -- Type specific plugins
    -- LaTeX
    { 'lervag/vimtex' },
    -- Markdown
    { 'iamcco/markdown-preview.nvim', build = { function() vim.fn["mkdp#util#install"]() end } },
    -- PIO
    { 'normen/vim-pio' },
}

require("lazy").setup(plugins)
