-- [[ Server Configurations ]] --
local servers = {
    clangd = {
        cmd = {
            "clangd-20",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders=true",
            "--query-driver=/opt/st/stm32cubeide_2.0.0/plugins/**/tools/bin/arm-none-eabi-*,/home/zulkarnaen/.espressif/tools/xtensa-esp-elf/esp-15.2.0_20251204/xtensa-esp-elf/bin/xtensa-esp32s3-elf-*",
        },
        init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_markers = { "compile_commands.json", ".git" },
    },
    arduino_language_server = {
        cmd = {
            "arduino-language-server",
            "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
            "-fqbn", "arduino:avr:uno",
        },
        filetypes = { "arduino" },
        root_markers = { "platformio.ini", ".git" },
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
        root_markers = { ".luarc.json", ".git" },
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
        root_markers = { "pyproject.toml", "setup.py", ".git" },
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
    automatic_enable = false,
})

for server_name, config in pairs(servers) do
    vim.lsp.config(server_name, config)
    vim.lsp.enable(server_name)
end

-- [[ LSP Attach ]] --
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
    callback = function(event)
        local function is_real_file_buffer(bufnr)
            local name = vim.api.nvim_buf_get_name(bufnr)
            return name ~= "" and not name:match("^%a[%w+.-]*://")
        end

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

        map("<leader>f", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, "Format buffer", { "n", "v" })

        map("[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, "Go to [P]revious [D]iagnostic")
        map("]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, "Go to [N]ext [D]iagnostic")
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
        if client and client.name == "clangd" and not is_real_file_buffer(event.buf) then
            vim.schedule(function()
                if vim.api.nvim_buf_is_valid(event.buf) then
                    vim.lsp.buf_detach_client(event.buf, client.id)
                end
            end)
            return
        end

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
