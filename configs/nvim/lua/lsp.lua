local lspconfig = require'lspconfig'
local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

require('lspconfig').ccls.setup{
    on_attach=require'completion'.on_attach;
    root_dir = lspconfig.util.root_pattern(".ccls");
    init_options = { cache = { directory= ".ccls-cache"; } }
}

configs.pylsp = {
  on_attach=require'completion'.on_attach;
  default_config = {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_dir = function(fname)
      local root_files = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        '.git',
      }
      return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
    end,
  },
  docs = {
    description = [[
https://github.com/python-lsp/python-lsp-server
A Python 3.6+ implementation of the Language Server Protocol.
The language server can be installed via `pipx install 'python-lsp-server[all]'`.
Further instructions can be found in the [project's README](https://github.com/python-lsp/python-lsp-server).
Note: This is a community fork of `pyls`.
    ]],
  },
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
require('lspconfig').pylsp.setup{}

-- commented options are defaults
require('lspkind').init({
    -- with_text = true,
    -- symbol_map = {
    --   Text = '',
    --   Method = 'ƒ',
    --   Function = '',
    --   Constructor = '',
    --   Variable = '',
    --   Class = '',
    --   Interface = 'ﰮ',
    --   Module = '',
    --   Property = '',
    --   Unit = '',
    --   Value = '',
    --   Enum = '了',
    --   Keyword = '',
    --   Snippet = '﬌',
    --   Color = '',
    --   File = '',
    --   Folder = '',
    --   EnumMember = '',
    --   Constant = '',
    --   Struct = ''
    -- },
})

require('lsp_signature').on_attach()
