local lualine = require('lualine')
-- Config
local config = {
  options = {
    -- Disable sections and component separators
    -- component_separators = '|',
    -- section_separators = '|',
    -- theme = 'palenight',
    -- theme = 'monokai-pro'
    theme = 'dracula-nvim'
    -- theme = 'gruvbox',
    -- theme = 'tokyonight'
    -- theme = 'codedark',
  },
  sections = {
    -- these are to remove the defaults
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1
      }
    },
  },
  inactive_sections = {
    lualine_c = { {
      'filename',
      file_status = true,
      path = 1
    } }
  }
}
lualine.setup(config)
