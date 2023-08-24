-- Diagnositc config
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
})

-- Turn on lsp status information
require('fidget').setup()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- LSP settings.
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.

    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    local vmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('v', keys, func, { buffer = bufnr, desc = desc })
    end


    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<c-]>', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('gr', require('telescope.builtin').lsp_references)
    nmap('<space>f', vim.lsp.buf.format, "[F]ormatting")
    vmap('<space>f', vim.lsp.buf.format, "[R]ange [F]ormatting")
    nmap('<space>a', vim.lsp.buf.code_action, "[C]ode [A]ction")


    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', vim.lsp.buf.format or vim.lsp.buf.formatting,
        { desc = 'Format current buffer with LSP' })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Enable the following language servers
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'pylsp', 'sumneko_lua', 'ccls' }
-- local servers = { 'rust_analyzer', 'tsserver', 'bashls', 'jsonls', 'yamlls', 'sumneko_lua', 'vimls', 'texlab', 'pylsp',
--     'ccls', 'pyright' }
local servers = {
    rust_analyzer = {},
    tsserver = {},
    bashls = {},
    jsonls = {},
    yamlls = {},
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        }
    },
    vimls = {},
    texlab = {},
    pylsp = {},
    grammarly = {},
    clangd = {},
},

    -- Ensure the servers above are installed
    require("mason").setup {
        ui = {
            icons = {
                package_installed = "✓"
            }
        }
    }
require("mason-lspconfig").setup {
    ensure_installed = vim.tbl_keys(servers),
}

-- Insert server that is not supported by mason
table.insert(servers, 'openscad_lsp')

require("mason-lspconfig").setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
        }
    end,
}


-- Setup generic LSP servers
-- for _, lsp in ipairs(servers) do
--     require('lspconfig')[lsp].setup {
--         on_attach = on_attach,
--         capabilities = capabilities,
--     }

-- Custom setup
-- Lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = { library = vim.api.nvim_get_runtime_file('', true) },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false, },
        },
    },
}

require('lspconfig').grammarly.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = require('lspconfig').util.find_git_ancestor(),
    settings = {
        grammarly = {
            filetype = { "markdown" }
        },
    },
}

-- require'lspconfig'.openscad_lsp.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     settings = {
--         openscad_lsp = {
--             cmd = "openscad-lsp",
--             fmt_style = "WebKit",
--         },
--     },
-- }

require('lspconfig').tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = require('lspconfig').util.root_pattern("compile_commands.json", ".ccls"),
    settings = {
        tsserver = {
            filetype = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
                "typescript.tsx" }
        },
    },
}

-- pylsp
require('lspconfig').pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        pylsp = {
            -- configurationSources = { "flake8" },
            plugins = {
                -- autopep8 = { enabled = true },
                -- jedi_completion = { enabled = false },
                -- jedi_hover = { enabled = false },
                -- jedi_references = { enabled = false },
                -- jedi_signature_help = { enabled = false },
                -- jedi_symbols = { enabled = false, all_scopes = false },
                pycodestyle = { enabled = false },
                flake8 = {
                    enabled = true,
                    ignore = {},
                    maxLineLength = 80
                },
                -- mypy = { enabled = false },
                -- isort = { enabled = false },
                -- yapf = { enabled = false },
                -- pylint = { enabled = false },
                -- pydocstyle = { enabled = false },
                mccabe = { enabled = false },
                pyflakes = { enabled = false },
                -- preload = { enabled = false },
                -- rope_completion = { enabled = false },
                black = {
                    enabled = true,
                    line_length = 80,
                    preview = true
                }
            }
        }
    }
}

-- ccls
-- require('lspconfig').ccls.setup {
--     flags = {
--         debounce_text_changes = 150,
--     },
--     on_attach = on_attach,
--     capabilities = capabilities,
--     root_dir = require('lspconfig').util.root_pattern("compile_commands.json", ".ccls", ".git"),
--     init_options = {
--         cache = { directory = ".ccls-cache"; cacheFormat = "json" };
--         compilationDatabaseDirectory = "build";
--     }
-- }
