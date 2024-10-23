# {inputs, ...}:{
#
# imports = [
# inputs.nixvim.homeManagerModules.nixvim
# ];
#   programs.nixvim = {
#     enable = true;
#
#     colorschemes.catppuccin.enable = true;
#     plugins.lualine.enable = true;
#   };
# }
{ pkgs, inputs, ... }: {
  imports = [
    # NOTE: The first thing you will want to do is uncommented on of the three imports below
    # depending on which module you chose to use to install Nixvim.
    #
    # Uncomment if you are using the home-manager module
    inputs.nixvim.homeManagerModules.nixvim
    # Uncomment if you are using the nixos module
    #inputs.nixvim.nixosModules.nixvim
    # Uncomment if you are using the nix-darwin module
    #inputs.nixvim.nixDarwinModules.nixvim

    # Plugins
    ./plugins/gitsigns.nix
    ./plugins/which-key.nix
    ./plugins/telescope.nix
    ./plugins/conform.nix
    ./plugins/lsp.nix
    ./plugins/nvim-cmp.nix
    ./plugins/mini.nix
    ./plugins/treesitter.nix

    # NOTE: Add/Configure additional plugins for Kickstart.nixvim
    #
    #  Here are some example plugins that I've included in the Kickstart repository.
    #  Uncomment any of the lines below to enable them (you will need to restart nvim).
    #
    ./plugins/kickstart/plugins/debug.nix
    ./plugins/kickstart/plugins/indent-blankline.nix
    # ./plugins/kickstart/plugins/lint.nix
    ./plugins/kickstart/plugins/autopairs.nix
    ./plugins/kickstart/plugins/neo-tree.nix
    #
    # NOTE: Configure your own plugins `see https://nix-community.github.io/nixvim/`
    # Add your plugins to ./plugins/custom/plugins and import them below
  ];

  /*
  =====================================================================
  ==================== READ THIS BEFORE CONTINUING ====================
  =====================================================================
  ========                                    .-----.          ========
  ========         .----------------------.   | === |          ========
  ========         |.-""""""""""""""""""-.|   |-----|          ========
  ========         ||                    ||   | === |          ========
  ========         ||  KICKSTART.NIXVIM  ||   |-----|          ========
  ========         ||                    ||   | === |          ========
  ========         ||                    ||   |-----|          ========
  ========         ||:Tutor              ||   |:::::|          ========
  ========         |'-..................-'|   |____o|          ========
  ========         `"")----------------(""`   ___________      ========
  ========        /::::::::::|  |::::::::::\  \ no mouse \     ========
  ========       /:::========|  |==hjkl==:::\  \ required \    ========
  ========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
  ========                                                     ========
  =====================================================================
  =====================================================================

  What is Kickstart.nixvim?

    Kickstart.nixvim is a starting point for your own configuration.
      The goal is that you can read every line of code, top-to-bottom, understand
      what your configuration is doing, and modify it to suit your needs.

      Once you've done that, you can start exploring, configuring and tinkering to
      make Neovim your own!

      If you don't know anything about Nixvim, Nix or Lua, I recommend taking some time to read through.
        - https://nix-community.github.io/nixvim/
        - https://learnxinyminutes.com/docs/nix/
        - https://learnxinyminutes.com/docs/lua/

  Kickstart.nixvim Guide:

    TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

      If you don't know what this means, type the following:
        - <escape key>
        - :
        - Tutor
        - <enter key>

      (If you already know the Neovim basics, you can skip this step.)

    Once you've completed that, you can continue working through **AND READING** the rest
    of the nixvim.nix.

    Next, run AND READ `:help`.
      This will open up a help window with some basic information
      about reading, navigating and searching the builtin help documentation.

      This should be the first place you go to look when you're stuck or confused
      with something. It's one of my favorite Neovim features.

      MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
      which is very useful when you're not exactly sure of what you're looking for.

    I have left several `:help X` comments throughout the nixvim.nix and the plugin .nix files
      These are hints about where to find more information about the relevant settings,
      plugins or Neovim features used in Kickstart.nixvim.

     NOTE: Look for lines like this

      Throughout the file. These are for you, the reader, to help you understand what is happening.
      Feel free to delete them once you know what you're doing, but they should serve as a guide
      for when you are first encountering a few different constructs in your Nixvim Neovim config.

  If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

  I hope you enjoy your Neovim journey,
  - JMartJonesy

  P.S. You can delete this when you're done too. It's your config now! :)
  */
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # You can easily change to a different colorscheme.
    # Add your colorscheme here and enable it.
    # Don't forget to disable the colorschemes you arent using
    #
    # If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    colorschemes = {
      # https://nix-community.github.io/nixvim/colorschemes/tokyonight/index.html
      tokyonight = {
        enable = true;
        settings = {
          # Like many other themes, this one has different styles, and you could load
          # any other, such as 'storm', 'moon', or 'day'.
          style = "night";
        };
      };
    };

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=globals#globals
    globals = {
      # Set <space> as the leader key
      # See `:help mapleader`
      mapleader = " ";
      maplocalleader = " ";

      # Set to true if you have a Nerd Font installed and selected in the terminal
      have_nerd_font = false;
    };

    # [[ Setting options ]]
    # See `:help vim.opt`
    # NOTE: You can change these options as you wish!
    #  For more options, you can see `:help option-list`
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=globals#opts
    opts = {
      # Show line numbers
      number = true;
      # You can also add relative line numbers, to help with jumping.
      #  Experiment for yourself to see if you like it!
      relativenumber = true;

      # Enable mouse mode, can be useful for resizing splits for example!
      mouse = "a";

      # Don't show the mode, since it's already in the statusline
      showmode = false;

      tapstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      expandtab = 4;
      smartindent = 4;

      wrap = true;

      hlsearch = false;
      incsearch = false;

      #  See `:help 'clipboard'`
      clipboard = {
        providers = {
          wl-copy.enable = true; # For Wayland
          xsel.enable = true; # For X11
        };

        # Sync clipboard between OS and Neovim
        #  Remove this option if you want your OS clipboard to remain independent.
        register = "unnamedplus";
      };

      # Enable break indent
      breakindent = true;

      # Save undo history
      undofile = true;

      # Case-insensitive searching UNLESS \C or one or more capital letters in search term
      ignorecase = true;
      smartcase = true;

      # Keep signcolumn on by default
      signcolumn = "yes";

      # Decrease update time
      updatetime = 250;

      # Decrease mapped sequence wait time
      # Displays which-key popup sooner
      timeoutlen = 300;

      # Configure how new splits should be opened
      splitright = true;
      splitbelow = true;

      # Sets how neovim will display certain whitespace characters in the editor
      #  See `:help 'list'`
      #  See `:help 'listchars'`
      list = true;
      # NOTE: .__raw here means that this field is raw lua code
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

      # Preview subsitutions live, as you type!
      inccommand = "split";

      # Show which line your cursor is on
      cursorline = true;

      # Minimal number of screen lines to keep above and below the cursor
      scrolloff = 10;

      # See `:help hlsearch`
      hlsearch = true;
    };

    # [[ Basic Keymaps ]]
    #  See `:help vim.keymap.set()`
    # https://nix-community.github.io/nixvim/keymaps/index.html
    keymaps = [
      # Clear highlights on search when pressing <Esc> in normal mode
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
      # Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
      # for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
      # is not what someone will guess without a bit more experience.
      #
      # NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
      # or just use <C-\><C-n> to exit terminal mode
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
        options = {
          desc = "Exit terminal mode";
        };
      }
# Loop through window numbers 1 to 9 and map ',' followed by the number to switch windows
  (lib.mkIf (window >= 1 && window <= 9) (map (i: {
    mode = "n";
    key = "," + toString i;
    action = toString i + "<c-w>w";
    description = "Move to window " + toString i;
  }) (lib.range 1 9)))
      # TIP: Disable arrow keys in normal mode
      /*
      {
        mode = "n";
        key = "<left>";
        action = "<cmd>echo 'Use h to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<right>";
        action = "<cmd>echo 'Use l to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<up>";
        action = "<cmd>echo 'Use k to move!!'<CR>";
      }
      {
        mode = "n";
        key = "<down>";
        action = "<cmd>echo 'Use j to move!!'<CR>";
      }
      */
      # Keybinds to make split navigation easier.
      #  Use CTRL+<hjkl> to switch between windows
      #
      #  See `:help wincmd` for a list of all window commands
  # Visual mode move lines with J and K
  {
    mode = "v";
    key = "J";
    action = ":m '>+1<CR>gv=gv";
  }
  {
    mode = "v";
    key = "K";
    action = ":m '<-2<CR>gv=gv";
  }

  # Normal mode J to join lines but keep cursor in position
  {
    mode = "n";
    key = "J";
    action = "mzJ`z";
  }

  # Scroll ctrl+d and ctrl+u while keeping cursor in the middle
  {
    mode = "n";
    key = "<C-d>";
    action = "<C-d>zz";
  }
  {
    mode = "n";
    key = "<C-u>";
    action = "<C-u>zz";
  }

  # Keep search terms in the middle of the screen
  {
    mode = "n";
    key = "n";
    action = "nzzzv";
  }
  {
    mode = "n";
    key = "N";
    action = "Nzzzv";
  }

  # Paste over selection without replacing the buffer content
  {
    mode = "x";
    key = "<leader>p";
    action = [["_dP"]];
  }

  # Yank to system clipboard
  {
    mode = ["n", "v"];
    key = "<leader>y";
    action = [["+y"]];
  }
  {
    mode = "n";
    key = "<leader>Y";
    action = [["+Y"]];
  }

  # Paste from system clipboard
  {
    mode = ["n", "v"];
    key = "<leader>p";
    action = [["+p"]];
  }
  {
    mode = ["n", "v"];
    key = "<leader>P";
    action = [["+P"]];
  }

  # Delete into black hole register
  {
    mode = ["n", "v"];
    key = "<leader>d";
    action = [["_d"]];
  }

  # Map Ctrl+c to behave like escape in insert mode
  {
    mode = "i";
    key = "<C-c>";
    action = "<Esc>";
  }

  # Disable Q and q in normal mode
  {
    mode = "n";
    key = "Q";
    action = "<nop>";
  }
  {
    mode = "n";
    key = "q";
    action = "<nop>";
  }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w><C-h>";
        options = {
          desc = "Move focus to the left window";
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w><C-l>";
        options = {
          desc = "Move focus to the right window";
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w><C-j>";
        options = {
          desc = "Move focus to the lower window";
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w><C-k>";
        options = {
          desc = "Move focus to the upper window";
        };
      }
  # Search and replace the word under cursor with confirmation
  {
    mode = "n";
    key = "<leader>s";
    action = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]];
    description = "Search and replace the word under cursor";
  }

  # Make the current file executable
  {
    mode = "n";
    key = "<leader>x";
    action = "<cmd>!chmod +x %<CR>";
    options = { silent = true; };
    description = "Make the current file executable";
  }

  # Insert Go error handling block
  {
    mode = "n";
    key = "<leader>ge";
    action = "iif err != nil {\n \n}<Esc> kk i";
    options = { noremap = true; silent = true; };
    description = "Insert Go error handling block";
  }
    ];

    # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
    autoGroups = {
      kickstart-highlight-yank = {
        clear = true;
      };
    };

    # [[ Basic Autocommands ]]
    #  See `:help lua-guide-autocommands`
    # https://nix-community.github.io/nixvim/NeovimOptions/autoCmd/index.html
    autoCmd = [
      # Highlight when yanking (copying) text
      #  Try it with `yap` in normal mode
      #  See `:help vim.highlight.on_yank()`
      {
        event = ["TextYankPost"];
        desc = "Highlight when yanking (copying) text";
        group = "kickstart-highlight-yank";
        callback.__raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      }
    ];

    plugins = {
      # Adds icons for plugins to utilize in ui
      web-devicons.enable = true;

      # Detect tabstop and shiftwidth automatically
      # https://nix-community.github.io/nixvim/plugins/sleuth/index.html
      sleuth = {
        enable = true;
      };

      # Highlight todo, notes, etc in comments
      # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
      todo-comments = {
        settings = {
          enable = true;
          signs = true;
        };
      };
    };

    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraplugins
    extraPlugins = with pkgs.vimPlugins; [
      # Useful for getting pretty icons, but requires a Nerd Font.
      nvim-web-devicons # TODO: Figure out how to configure using this with telescope
    ];

    # TODO: Figure out where to move this
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapre
    extraConfigLuaPre = ''
      if vim.g.have_nerd_font then
        require('nvim-web-devicons').setup {}
      end
    '';

    # The line beneath this is called `modeline`. See `:help modeline`
    # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapost
    extraConfigLuaPost = ''
      -- vim: ts=2 sts=2 sw=2 et
    '';
  };
}
