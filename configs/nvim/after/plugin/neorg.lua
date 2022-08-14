require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/Documents/notes/work",
                    private = "~/Documents/notes/private",
                }
            }
        },
        ["core.norg.concealer"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                -- Configuration here
            }
        },
        ["core.integrations.telescope"] = {},
    }
}

require('nvim-treesitter.configs').setup {
    ensure_installed = { "norg", --[[ other parsers you would wish to have ]] },
    highlight = { -- Be sure to enable highlights if you haven't!
        enable = true,
    }
}
