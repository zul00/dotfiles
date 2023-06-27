require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    entry_ws = "~/Documents/notes",
                },
                default_workspace = "entry_ws",
                index = "index.norg"
            }
        },
        ["core.concealer"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                -- Configuration here
            }
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
}
