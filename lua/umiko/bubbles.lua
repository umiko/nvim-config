-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

local diagnostics = {
  'diagnostics',

  -- Table of diagnostic sources, available sources are:
  --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
  -- or a function that returns a table as such:
  --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
  sources = { 'nvim_lsp' },

  -- Displays diagnostics for the defined severity types
  sections = { 'error', 'warn', 'info', 'hint' },
  align = 'center',
  diagnostics_color = {
    -- Same values as the general color option can be used here.
    error = 'DiagnosticError', -- Changes diagnostics' error color.
    warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
    info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
    hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
  },
  symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
  colored = true,          -- Displays diagnostics status in color if set to true.
  update_in_insert = true, -- Update diagnostics in insert mode.
  always_visible = true,   -- Show diagnostics even if there are none.
};

require('lualine').setup {
  options = {
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { right = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { {
      'fileformat',
      symbols = {
        unix = '', -- e712
        dos = '', -- e70f
        mac = '', -- e711
      }
    },
    },
    lualine_x = {},
    lualine_y = { 'filetype' },
    lualine_z = {
      { 'location', separator = { left = '' }, left_padding = 2 },
      'progress'
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },

  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      function()
        return "%="
      end,
      diagnostics,
      function()
        return "%="
      end,
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'quickfix' },
}
