-- Diagnositc config
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true,
})

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
    nmap('<space>f', vim.lsp.buf.formatting_seq_sync, "[F]ormatting")
    vmap('<space>f', vim.lsp.buf.range_formatting, "[R]ange [F]ormatting")

    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', vim.lsp.buf.format or vim.lsp.buf.formatting,
        { desc = 'Format current buffer with LSP' })
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Enable the following language servers
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'pylsp', 'sumneko_lua', 'ccls' }
local servers = { 'rust_analyzer', 'tsserver', 'bashls', 'jsonls', 'yamlls', 'sumneko_lua', 'vimls', 'texlab', 'pylsp',
    'ccls' }

-- Ensure the servers above are installed
require('nvim-lsp-installer').setup {
    ensure_installed = servers,
}

-- Setup generic LSP servers
for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- Custom setup
-- Lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
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

-- pylsp
require('lspconfig').pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        pylsp = {
            configurationSources = { "flake8" },
            plugins = {
                -- jedi_completion = {enabled = true},
                -- jedi_hover = {enabled = true},
                -- jedi_references = {enabled = true},
                -- jedi_signature_help = {enabled = true},
                -- jedi_symbols = {enabled = true, all_scopes = true},
                -- pycodestyle = {enabled = false},
                -- flake8 = {
                --   enabled = true,
                --   ignore = {},
                --   maxLineLength = 160
                -- },
                -- mypy = {enabled = false},
                -- isort = {enabled = false},
                -- yapf = {enabled = false},
                -- pylint = {enabled = false},
                pydocstyle = { enabled = false },
                -- mccabe = {enabled = false},
                -- preload = {enabled = false},
                rope_completion = { enabled = false }
            }
        }
    }
}

-- ccls
require('lspconfig').ccls.setup {
    flags = {
        debounce_text_changes = 150,
    },
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = require('lspconfig').util.root_pattern("compile_commands.json", ".ccls"),
    init_options = { cache = { directory = ".ccls-cache"; } }
}
