{
    programs.nixvim = {
        plugins.lualine = {
        enable = true;
        settings = 
{
  options = {
    theme = "gruvbox-material",
    disabled_filetypes = {
      __unkeyed-1 = "startify",
      __unkeyed-2 = "neo-tree",
      statusline = {
        "dap-repl"
      },
      winbar = {
        "aerial",
        "dap-repl",
        "neotest-summary"
      }
    },
    globalstatus = true
  },
  sections = {
    lualine_a = {
      {
        __unkeyed-1 = function()
          return vim.api.nvim_win_get_number(0)
        end
      },
      "mode"
    },
    lualine_d = {
      {
        __unkeyed-1 = "filename",
        file_status = true,
        path = 1
      }
    }
  },
  inactive_sections = {
    lualine_a = {
      {
        __unkeyed-1 = function()
          return vim.api.nvim_win_get_number(0)
        end
      }
    },
    lualine_c = {
      {
        __unkeyed-1 = "filename",
        file_status = true,
        path = 1
      }
    }
  },
  tabline = {
    lualine_a = {
      {
        __unkeyed-1 = "buffers",
        symbols = {
          alternate_file = ""
        }
      }
    },
    lualine_z = {
      "tabs"
    }
  },
  winbar = {
    lualine_c = {
      {
        __unkeyed-1 = "navic"
      }
    },
    lualine_x = {
      {
        __unkeyed-1 = "filename",
        newfile_status = true,
        path = 3,
        shorting_target = 150
      }
    }
  }
};
    };

    };
}
