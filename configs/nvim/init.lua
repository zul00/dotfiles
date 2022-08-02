--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','

require("plugins")
require("style")
require("configs")
