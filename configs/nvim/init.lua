-- Helper functions
function PrintCurrentFileName()
    local info = debug.getinfo(2, "S")   -- use level 2 to get the caller's file
    local full_path = info.source:sub(2) -- remove '@'
    local file_name = full_path:match("^.+/(.+)$") or full_path
    print("Loading file: " .. file_name)
end

-- Load basic configuration
require("configs.vim_basics")

-- Load plugin loader
-- NOTE: plugin configuration are automatically loaded from ./after/plugin
require("plugins")

-- REVIEW: What was it for again?
require("luasnip.loaders.from_vscode").lazy_load()

-- NOTE: Enable when needed
-- vim.lsp.set_log_level("debug")
