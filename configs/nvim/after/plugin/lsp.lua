-- [[ Core LSP Setup ]] --
require('fidget').setup()

-- Diagnostic configuration
vim.diagnostic.config({
    virtual_text = { spacing = 4, prefix = "●" },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- [[ Server Configurations ]] --
local servers = {
    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
        },
        init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = require('lspconfig.util').root_pattern("compile_commands.json", ".git") or vim.fn.getcwd(),
    },
    arduino_language_server = {
        cmd = {
            "arduino-language-server",
            "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
            "-fqbn", "arduino:avr:uno",
        },
        filetypes = { "arduino" },
        root_dir = require('lspconfig.util').root_pattern("platformio.ini", ".git") or vim.fn.getcwd(),
    },
    lua_ls = {
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim" } },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = { enable = false },
            },
        },
        filetypes = { "lua" },
        root_dir = require('lspconfig.util').root_pattern(".luarc.json", ".git") or vim.fn.getcwd(),
    },
    pyright = {
        filetypes = { "python" },
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "basic",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                },
            },
        },
        root_dir = require('lspconfig.util').root_pattern("pyproject.toml", "setup.py", ".git") or vim.fn.getcwd(),
    },
}

-- [[ Mason and LSPConfig ]] --
require("mason").setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    }
})

require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(servers),
})

-- [[ LSP Attach ]] --
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map("<leader>rn", vim.lsp.buf.rename, '[R]e[n]ame')

        map("<c-]>", require('telescope.builtin').lsp_definitions, "LSP: [G]oto [D]efinition")
        map("gD", vim.lsp.buf.declaration, "LSP: [G]oto [D]eclaration")
        map("grf", require('telescope.builtin').lsp_references, "LSP: [G]oto [R]eferences")
        map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
        map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
        map("gi", vim.lsp.buf.implementation, "LSP: [G]oto [I]mplementation")

        map("K", vim.lsp.buf.hover, "LSP: Hover Documentation")
        map("<C-k>", vim.lsp.buf.signature_help, "LSP: Signature Documentation")
        map("<leader>rn", vim.lsp.buf.rename, "LSP: [R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "LSP: [C]ode [A]ction", { "n", "v" })

        map("<leader>f", function() vim.lsp.buf.format({ async = true }) end,
            "LSP: [F]ormat buffer", { "n", "v" })

        map("[d", vim.diagnostic.goto_prev, "Go to [P]revious [D]iagnostic")
        map("]d", vim.diagnostic.goto_next, "Go to [N]ext [D]iagnostic")
        map("<leader>e", vim.diagnostic.open_float, "Show diagnostic [E]rror messages")
        map("<leader>fl", vim.diagnostic.setloclist, "Open diagnostic quick[F]ix [L]ist")

        ---@param client vim.lsp.Client
        ---@param method vim.lsp.protocol.Method
        ---@param bufnr? integer some lsp support methods only in specific files
        ---@return boolean
        local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
                return client:supports_method(method, bufnr)
            else
                return client.supports_method(method, { bufnr = bufnr })
            end
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('user_lsp_highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('user_lsp_detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = 'user_lsp_highlight', buffer = event2.buf }
                end,
            })
        end
    end,
})

-- [[ Workspace Management ]] --
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[W]orkspace [A]dd Folder" })
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "[W]orkspace [R]emove Folder" })
vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "[W]orkspace [L]ist Folders" })
