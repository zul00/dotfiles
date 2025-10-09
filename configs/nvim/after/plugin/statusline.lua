local function mode_icon()
  return '' -- you can change this to any icon you like
end

local function scrollbar()
  local current_line = vim.fn.line('.')
  local total_lines = vim.fn.line('$')
  local chars = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index] .. chars[index]
end

require('lualine').setup {
  options = {
    theme = 'auto', -- or 'gruvbox', 'tokyonight', etc., based on your colorscheme
    icons_enabled = true,
    globalstatus = false, -- optional: makes the statusline span the entire width in Neovim 0.7+
  },
  sections = {
    lualine_a = { {
        mode_icon,
        color = { gui = 'bold' }, -- mode color will be handled automatically by lualine
      }, },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { scrollbar },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
}
