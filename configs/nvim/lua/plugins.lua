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
vim.g.maplocalleader = ","

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
    { 'j-hui/fidget.nvim',                          opts = {} },
    { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'mason-org/mason.nvim', },
            { 'mason-org/mason-lspconfig.nvim', },
            { 'folke/lsp-colors.nvim', },
            { 'folke/lsp-trouble.nvim', }
        }
    },

    {
        "yetone/avante.nvim",
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        -- ⚠️ must add this setting! ! !
        build = vim.fn.has("win32") ~= 0
            and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        event = "VeryLazy",
        mode = "legacy",
        version = false, -- Never set this value to "*"! Never!
        ---@module 'avante'
        ---@type avante.Config
        opts = {
            behaviour = {
                auto_approve_tool_permissions = false,
            },
            -- add any opts here
            -- this file can contain specific instructions for your project
            instructions_file = "avante.md",
            -- for example
            provider = "openai",
            providers = {
                openai = {
                    model = "gpt-4o-mini",
                    api_key_name = "OPENAI_API_KEY",
                },
                copilot = {
                    model = "claude-3-5-sonnet-20240620", -- Default Copilot model (Claude 3.5 Sonnet); change to "gpt-4o" for OpenAI or others available in your Copilot sub
                    extra_request_body = {
                        temperature = 0.0,                -- Lower for more deterministic responses
                        max_tokens = 20480,
                    },
                },
                claude = {
                    endpoint = "https://api.anthropic.com",
                    model = "claude-sonnet-4-20250514",
                    timeout = 30000, -- Timeout in milliseconds
                    extra_request_body = {
                        temperature = 0.75,
                        max_tokens = 20480,
                    },
                },
                moonshot = {
                    endpoint = "https://api.moonshot.ai/v1",
                    model = "kimi-k2-0711-preview",
                    timeout = 30000, -- Timeout in milliseconds
                    extra_request_body = {
                        temperature = 0.75,
                        max_tokens = 32768,
                    },
                },
            },
            -- 🔑 This is the important part:
            edits = {
                confirm = true, -- wait for manual accept/cancel
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-mini/mini.pick",           -- for file_selector provider mini.pick
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
            "ibhagwan/fzf-lua",              -- for file_selector provider fzf
            "stevearc/dressing.nvim",        -- for input provider dressing
            "folke/snacks.nvim",             -- for input provider snacks
            "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua",        -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },

    -- Debugging
    { 'mfussenegger/nvim-dap',
        -- Debugging tool for Neovim
    },
    { 'mfussenegger/nvim-dap-python',
        -- DAP for Python
    },
    {
        'jedrzejboczar/nvim-dap-cortex-debug',
        dependencies = 'mfussenegger/nvim-dap',
        -- Cortex-Debug extension for DAP
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = 'nvim-neotest/nvim-nio',
        -- UI for debugging
    },

    -- Completions
    { 'hrsh7th/nvim-cmp',                   dependencies = { 'hrsh7th/cmp-nvim-lsp' } },
    { 'L3MON4D3/LuaSnip',                   dependencies = { 'saadparwaiz1/cmp_luasnip' } },
    { 'rafamadriz/friendly-snippets' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'petertriho/cmp-git' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },

    -- Tools
    { 'wakatime/vim-wakatime', -- Wakatime plugin for time tracking
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    { 'majutsushi/tagbar', -- Display tags in a window
    },
    {
        'folke/zen-mode.nvim',
        opts = {
            plugins = {
                tmux = { enabled = true }, -- disables the tmux statusline
                wezterm = {
                    enabled = false,
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
