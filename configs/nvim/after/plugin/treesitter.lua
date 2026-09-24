local parsers = {
    "lua",
    "latex",
    "bash",
    "typescript",
    "rust",
    "go",
    "python",
    "c",
    "cpp",
    "vim",
    "yaml",
    "toml",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "beancount",
}

local highlight_filetypes = {
    "lua",
    "tex",
    "bash",
    "typescript",
    "rust",
    "go",
    "python",
    "c",
    "cpp",
    "vim",
    "yaml",
    "toml",
    "vimdoc",
    "query",
    "markdown",
    "beancount",
}

require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/treesitter",
})

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("user_treesitter_start", { clear = true }),
    pattern = highlight_filetypes,
    callback = function(event)
        pcall(vim.treesitter.start, event.buf)
    end,
})

require("treesitter-context").setup({})
