-- Helper functions
function PrintCurrentFileName()
    local info = debug.getinfo(2, "S") -- use level 2 to get the caller's file
    local full_path = info.source:sub(2) -- remove '@'
    local file_name = full_path:match("^.+/(.+)$") or full_path
    print("Loading file: " .. file_name)
end

local function load_modules_from(dir)
    local path = vim.fn.stdpath("config") .. "/lua/" .. dir
    for _, file in ipairs(vim.fn.readdir(path)) do
        if file:match("%.lua$") then
            local module = dir:gsub("/", ".") .. "." .. file:gsub("%.lua$", "")
            require(module)
        end
    end
end


-- Load basic configuration
require("configs.vim_basics")

load_modules_from("configs")
require("plugins")
load_modules_from("plugins")

-- REVIEW: What was it for again?
require("luasnip.loaders.from_vscode").lazy_load()

-- NOTE: Enable when needed
-- vim.lsp.set_log_level("debug")
