require('neorg').setup {
    -- Tell Neorg what modules to load
    load = {
        ["core.defaults"] = {}, -- Load all the default modules
        ["core.highlights"] = {}, -- Load all the default modules
        ["core.norg.concealer"] = {
          config = {
            icon_preset = "varied",
            markup_preset = "dimmed"
          }
        }, -- Allows for use of icons
        ["core.keybinds"] = { -- Configure core.keybinds
                config = {
                    default_keybinds = true, -- Generate the default keybinds
                    neorg_leader = "<Leader>o" -- This is the default if unspecified
                }
            },
        ["core.norg.completion"] = {
          config = {
              engine = "nvim-cmp" -- We current support nvim-compe and nvim-cmp only
          }
        },
        ["core.norg.dirman"] = { -- Manage your directories with Neorg
          config = {
              workspaces = {
                  twtg = "~/Documents/notes/twtg",
                  private = "~/Documents/notes/private"
                }
            }
        },
        ["core.gtd.base"] = {
          config = {
            workspace = "twtg",
          },
        },
        ["core.integrations.telescope"] = {
          config = {},
        },
        ["core.norg.journal"] = {},
        ["core.norg.qol.toc"] = {},
        ["core.presenter"] = {}
  },
}

local neorg_callbacks = require("neorg.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
            { "<C-s>", "core.integrations.telescope.find_linkable" },
        },

        i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
        },
    }, {
        silent = true,
        noremap = true,
    })
end)

require("zen-mode").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
