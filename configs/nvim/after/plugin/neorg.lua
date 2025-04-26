require("neorg").setup({
    load = {
        ["core.defaults"] = {}, -- Loads default behavior
        ["core.concealer"] = {}, -- Adds pretty icons and folding
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/Documents/notes",
                },
                default_workspace = "notes",
            },
        },
        ["core.integrations.telescope"] = {},
        ["core.integrations.treesitter"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                -- Configuration here
            }
        },
        ["core.qol.toc"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                -- Configuration here
            }
        },
        ["core.export"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                -- Configuration here
            }
        },
        ["core.export.markdown"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                -- Configuration here
            }
        }
    }
})
