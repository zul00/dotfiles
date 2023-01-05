require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    twtg = "~/Documents/notes/twtg",
                    tii = "~/Documents/notes/tii",
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
        ["core.integrations.treesitter"] = {
           config = { -- Note that this table is optional and doesn't need to be provided
               -- Configuration here
           }
        },
        ["core.norg.qol.toc"] = {
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
