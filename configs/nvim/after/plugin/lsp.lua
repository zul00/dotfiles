-- Turn on lsp status information
require('fidget').setup()

-- Enhanced on_attach function with modern LSP keymaps
local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, silent = true }

    -- LSP keybindings
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,
        vim.tbl_extend("force", opts, { desc = "LSP: [G]oto [D]efinition" }))
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
        vim.tbl_extend("force", opts, { desc = "LSP: [G]oto [D]eclaration" }))
    vim.keymap.set("n", "gr", vim.lsp.buf.references,
        vim.tbl_extend("force", opts, { desc = "LSP: [G]oto [R]eferences" }))
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
        vim.tbl_extend("force", opts, { desc = "LSP: [G]oto [I]mplementation" }))
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition,
        vim.tbl_extend("force", opts, { desc = "LSP: [G]oto [T]ype Definition" }))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP: Hover Documentation" }))
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help,
        vim.tbl_extend("force", opts, { desc = "LSP: Signature Documentation" }))
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP: [R]e[n]ame" }))
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
        vim.tbl_extend("force", opts, { desc = "LSP: [C]ode [A]ction" }))
    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
    end, vim.tbl_extend("force", opts, { desc = "LSP: [F]ormat buffer" }))

    -- Diagnostic keymaps
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,
        vim.tbl_extend("force", opts, { desc = "Go to [P]revious [D]iagnostic" }))
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next,
        vim.tbl_extend("force", opts, { desc = "Go to [N]ext [D]iagnostic" }))
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float,
        vim.tbl_extend("force", opts, { desc = "Show diagnostic [E]rror messages" }))
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist,
        vim.tbl_extend("force", opts, { desc = "Open diagnostic [Q]uickfix list" }))

    -- Debug test keymap
    vim.keymap.set("n", "<leader>xx", function()
        print("LSP leader map works in buffer " .. bufnr .. " with client: " .. client.name)
    end, { buffer = bufnr, desc = "Debug LSP attachment" })

    -- Highlight references under cursor (if supported)
    if client.supports_method("textDocument/documentHighlight") then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = bufnr,
            group = "lsp_document_highlight",
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = bufnr,
            group = "lsp_document_highlight",
            callback = vim.lsp.buf.clear_references,
        })
    end
end

-- Enhanced capabilities with completion support
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- If you have nvim-cmp installed, uncomment the following:
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable folding capabilities for nvim-ufo if installed
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

-- Configure diagnostic display
vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "●",
    },
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

-- Customize diagnostic signs
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Server configurations
local servers = {
    -- Python
    pyright = {
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "basic",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                }
            }
        }
    },

    -- Add more servers as needed
    -- lua_ls = {
    --   settings = {
    --     Lua = {
    --       runtime = { version = "LuaJIT" },
    --       diagnostics = { globals = { "vim" } },
    --       workspace = {
    --         library = vim.api.nvim_get_runtime_file("", true),
    --         checkThirdParty = false
    --       },
    --       telemetry = { enable = false },
    --     }
    --   }
    -- },
}

-- Setup Mason
require("mason").setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- Setup Mason-LSPConfig
require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = true,
})

-- Setup each server (choose one method to avoid duplicates)
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

if mason_lspconfig.setup_handlers then
    -- Use mason-lspconfig handlers (newer versions)
    mason_lspconfig.setup_handlers({
        -- Default handler for servers not explicitly configured
        function(server_name)
            if not servers[server_name] then
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end
        end,

        -- Configured servers
        ["pyright"] = function()
            local config = vim.tbl_deep_extend("force", {
                capabilities = capabilities,
                on_attach = on_attach,
            }, servers.pyright or {})
            lspconfig.pyright.setup(config)
        end,

        -- Add handlers for other servers as needed
        -- ["lua_ls"] = function()
        --   local config = vim.tbl_deep_extend("force", {
        --     capabilities = capabilities,
        --     on_attach = on_attach,
        --   }, servers.lua_ls or {})
        --   lspconfig.lua_ls.setup(config)
        -- end,
    })
else
    -- Fallback for older mason-lspconfig versions - setup servers directly
    for server_name, server_config in pairs(servers) do
        local config = vim.tbl_deep_extend("force", {
            capabilities = capabilities,
            on_attach = on_attach,
        }, server_config)
        lspconfig[server_name].setup(config)
    end

    -- Setup any other installed servers not in our config
    local installed_servers = mason_lspconfig.get_installed_servers()
    for _, server_name in ipairs(installed_servers) do
        if not servers[server_name] then
            lspconfig[server_name].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end
    end
end

-- Global leader test
vim.keymap.set("n", "<leader>zz", function()
    print("Leader works (global)")
end, { desc = "Debug: leader global" })

-- LSP attach notification and additional setup
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf

        -- Notify when LSP attaches
        vim.notify(("LSP attached: %s (buf %d)"):format(client.name, bufnr), vim.log.levels.INFO)

        -- Enable inlay hints if supported (Neovim 0.10+)
        if vim.lsp.inlay_hint and client.supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

            -- Toggle inlay hints
            vim.keymap.set("n", "<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
            end, { buffer = bufnr, desc = "[T]oggle Inlay [H]ints" })
        end
    end,
})

-- Optional: Auto-format on save for specific filetypes
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.py", "*.lua", "*.js", "*.ts" },
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end,
-- })

-- Optional: Workspace folders management
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "[W]orkspace [A]dd Folder" })
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "[W]orkspace [R]emove Folder" })
vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "[W]orkspace [L]ist Folders" })
