vim.g['mkdp_browser'] = 'firefox'
vim.g['mkdp_theme'] = 'light'
-- vim.cmd([[
-- let g:mkdp_preview_options = {
--     \ 'mkit': {},
--     \ 'katex': {},
--     \ 'uml': {
--     \   'server': 'https://plantuml.hq.twtg.io/uml/'
--     \ },
--     \ 'maid': {},
--     \ 'disable_sync_scroll': 0,
--     \ 'sync_scroll_type': 'middle',
--     \ 'hide_yaml_meta': 1,
--     \ 'sequence_diagrams': {},
--     \ 'flowchart_diagrams': {},
--     \ 'content_editable': v:false,
--     \ 'disable_filename': 0,
--     \ 'toc': {}
--     \ }

-- echo g:mkdp_preview_options
-- ]])

local nnoremap = require("remap").nnoremap

nnoremap('<F5>', '<cmd>MarkdownPreview<CR>', { silent = true })
