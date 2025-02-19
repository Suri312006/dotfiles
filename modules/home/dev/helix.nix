{ pkgs, lib, inputs, ... }: {
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;
    defaultEditor = true;
    extraPackages = with pkgs; [
      # markdown-oxide
      gopls
      nil
      texlab
      taplo
      lua-language-server
      haskell-language-server
      python312Packages.python-lsp-server
      typescript-language-server
      svelte-language-server
      tailwindcss-language-server
      emmet-language-server
      marksman
    ];

    settings = {
      theme = lib.mkForce "gruvbox_dark_hard";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";

      };

      language-server.rust-analyzer.config.check.command = "clippy";

      editor = {
        line-number = "relative";
        inline-diagnostics.cursor-line = "warning";
        end-of-line-diagnostics = "hint";
        color-modes = true;
        file-picker.hidden = false;
        completion-trigger-len = 1;
        completion-timeout = 5;

        auto-save = { focus-lost = true; };

        lsp = { display-inlay-hints = true; };

        statusline = {
          left = [
            "mode"
            "spinner"
            "file-name"
            "file-type"
            "total-line-numbers"
            "file-encoding"
          ];
          right = [
            "version-control"
            "position"
            "selections"
            "primary-selection-length"
            "position-percentage"
            "spacer"
            "workspace-diagnostics"
          ];
          separator = "│";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
      };
      keys.normal = { X = "extend_line_above"; };

    };

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
      }

      {
        name = "svelte";
        auto-format = true;
        formatter = {
          command = "dprint";
          args = [ "fmt" "--stdin" "svelte" ];
        };

        language-servers = [
          # "emmet-lsp"
          "svelteserver"
          # "tailwindcss-ls"
          "tailwindcss-language-server"

          # "typescript-language-server"
        ];
      }
      {
        name = "html";
        language-servers = [ "vscode-html-language-server" "tailwindcss-ls" ];
      }
      {
        name = "css";
        language-servers = [ "vscode-css-language-server" "tailwindcss-ls" ];
      }
    ];

  };
}

# { pkgs, ... }:

# {
#   programs.helix = {
#     enable = true;
#     defaultEditor = true;
#     extraPackages = with pkgs; [
#       markdown-oxide
#       # marksman
#       gopls
#       nil
#       texlab
#       taplo
#       lua-language-server
#       haskell-language-server

#       python312Packages.python-lsp-server
#       vscode-langservers-extracted # html/css/json/eslint
#       typescript-language-server
#       svelte-language-server
#       tailwindcss-language-server
#       emmet-language-server
#       dprint # formatter
#     ];

#     # [[language]]
#     # name = "mylang"
#     # scope = "source.mylang"
#     # injection-regex = "mylang"
#     # file-types = ["mylang", "myl"]
#     # comment-tokens = "#"
#     # indent = { tab-width = 2, unit = "  " }
#     # formatter = { command = "mylang-formatter" , args = ["--stdin"] }
#     # language-servers = [ "mylang-lsp" ]
#     languages = {
#       language = [
#         {
#           name = "haskell";
#           file-types = ["lc" "hs" "lhs"];
#           language-servers = [
#             "haskell-language-server"            
#           ];
#         }
#         {
#           name = "c";
#           auto-format = true;
#           formatter = {
#             command = "clang-format";
#           };
#           indent = { tab-width = 4; unit = "    "; };
#         }
#         {
#           name = "rust";
#           auto-format = true;
#           formatter = {
#             command = "cargo fmt";
#           };
#           indent = { tab-width = 4; unit = "    "; };
#         }
#         {
#           name = "svelte";
#           auto-format = true;
#           formatter = { 
#             command = "dprint"; 
#             args = ["fmt" "--stdin" "svelte"];
#           };

#           language-servers = [
#             # "emmet-lsp"
#             "svelteserver"
#             # "tailwindcss-ls"
#             "tailwindcss-language-server"

#             # "typescript-language-server"
#           ];
#         }
#         {
#           name = "html";
#           language-servers = [ "vscode-html-language-server" "tailwindcss-ls" ];
#         }
#         {
#           name = "css";
#           language-servers = [ "vscode-css-language-server" "tailwindcss-ls" ];
#         }
#       ];

#       language-server = {       
#         emmet-lsp = {
#           command = "emmet-language-server";
#           args = ["--stdio"];
#         };
#         tailwind-ls = {
#           command = "tailwindcss-language-server";
#           args = ["--stdio"];
#         };
#       #   golps = {
#       #     command = "gopls;
#       #   };
#       };

#     };
#     settings = {
#       # theme = "kanagawa";
#       theme = "o2";

#       # theme = "ayu_evolve";
#       # voxed, gruvbox_dark_hard, tokyonight, doom_acario_dark, kaolin_valley_dark, ayu_dark, material_deep_ocean, monokai_pro_octagon, poimandres, starlight, term16_dark, varua 
#       editor = {
#         auto-save = {
#           focus-lost = true;
#           # after-delay.enable = true;
#           # after-delay.timeout = 300;
#         };
#         auto-format = true;
#         bufferline = "multiple";
#         color-modes = true;
#         cursorline = true;
#         cursor-shape = {
#           insert = "bar";
#           normal = "block";
#           select = "underline";
#         };
#         file-picker.hidden = false;
#         idle-timeout = 50;
#         indent-guides = {
#           render = true;
#           character = " ";
#         };
#         line-number = "relative";
#         lsp.display-messages = true;
#         scrolloff = 10;
#         shell = ["zsh" "-ic"];
#         soft-wrap = {
#           enable = true;
#           # max-wrap = 25; # increase value to reduce forced mid-word wrapping
#           # max-indent-retain = 0; max indent to carry over when soft wrapping a line.
#           # wrap-indicator = "";  # set wrap-indicator to "" to hide it
#         };
#         statusline = {
#           # left = ["mode" "spacer"  "spinner"  "spacer"  "version-control"  "file-name"  "file-modification-indicator"];
#           # right = ["diagnostics"  "version-control"  "selections"  "position"  "total-line-numbers"  "file-encoding"  "file-type"];
#           left = ["mode" "spinner" "file-name" "file-type" "total-line-numbers" "file-encoding"];
#           right = ["selections" "primary-selection-length" "position" "position-percentage" "spacer" "diagnostics" "workspace-diagnostics" "version-control"];
#           separator = "│";
#           mode.normal = "NORMAL";
#           mode.insert = "INSERT";
#           mode.select = "SELECT";
#         };
#       };
#       # keys.picker = { # doesn't exist yet 😭
#       #   "C-k" = "previous_entry";
#       #   "C-j" = "next_entry";
#       # };
#       keys.normal.C-y = {
#         # Open the file(s) in the current window
#         y = ":sh zellij run -c -f -x 10% -y 10% --width 80% --height 80% -- bash $DOT/helix/yazi-picker.sh open";
#         # Open the file(s) in a vertical pane
#         v = ":sh zellij run -c -f -x 10% -y 10% --width 80% --height 80% -- bash $DOT/helix/yazi-picker.sh vsplit";
#         # Open the file(s) in a horizontal pane
#         h = ":sh zellij run -c -f -x 10% -y 10% --width 80% --height 80% -- bash $DOT/helix/yazi-picker.sh hsplit";
#       };
#       keys.normal = {
#         esc = [ "collapse_selection" "keep_primary_selection" ];
#         y = ["yank" "yank_to_clipboard"];
#         d = ["delete_selection" "yank_to_clipboard"];

#         # C-y = ":sh zellij run -c -f -x 10% -y 10% --width 80% --height 80% -- bash ~/.config/helix/yazi-picker.sh open";

#         j = [ "move_line_down" ];
#         k = [ "move_line_up" ];
#         # J = [ "move_visual_line_down" "align_view_center" ];
#         # K = [ "move_visual_line_up" "align_view_center" ];
#         X = "extend_line_above";
#         "{" = [ "goto_prev_paragraph" "collapse_selection"];
#         "}" = [ "goto_next_paragraph" "collapse_selection"];

#         C-j = ["extend_to_line_bounds"  "delete_selection"  "paste_after"];
#         C-k = ["extend_to_line_bounds"  "delete_selection"  "move_line_up"  "paste_before"];
#         C-n = ["scroll_down"];
#         C-p = ["scroll_up"];

#         space = {
#           W = ":write";
#         };
#       };
#     };
#   };
# }
