local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "black" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
    },
    formatters = {
        clang_format = {
            command = "clang-format-20",
        }
    }
})
