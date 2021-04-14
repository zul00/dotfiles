
local lspconfig = require'lspconfig'

require('lspconfig').ccls.setup{
    on_attach=require'completion'.on_attach;
    root_dir = lspconfig.util.root_pattern(".ccls");
    init_options = { cache = { directory= ".ccls-cache"; } }
}

require('lspconfig').tsserver.setup{
    on_attach=require'completion'.on_attach;
    root_dir = lspconfig.util.root_pattern(".git");
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      -- disable virtual text
      virtual_text = false,

      -- show signs
      signs = true,

      -- delay update diagnostics
      update_in_insert = false,
      -- display_diagnostic_autocmds = { "InsertLeave" },

    }
  )

require('lspconfig').jedi_language_server.setup{}
require('lspconfig').pyls.setup{}
