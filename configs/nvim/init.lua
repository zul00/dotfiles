-- print("Hello from init.lua")

-- FIXME: This should not be needed!
vim.o.termguicolors = true
require("plugins")
require("configs.theme")

local function load_modules_from(dir)
    local path = vim.fn.stdpath("config") .. "/lua/" .. dir
    for _, file in ipairs(vim.fn.readdir(path)) do
        if file:match("%.lua$") then
            local module = dir:gsub("/", ".") .. "." .. file:gsub("%.lua$", "")
            require(module)
        end
    end
end

load_modules_from("configs")
load_modules_from("plugins")

vim.g['localvimrc_sandbox'] = 0
vim.g['localvimrc_whitelist'] = '*/.lvimrc'
require("luasnip.loaders.from_vscode").lazy_load()
-- REVIEW: When treesitter is running, the dark configuration that was set in configs.theme is ignored and needs to be recalled. But if we have the line below, it works fine.
vim.o.background = "dark" -- or "light" for light mode

-- vim.lsp.set_log_level("debug")
