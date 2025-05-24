{ pkgs, lib, inputs, ... }: {

  home.file.".config/helix/ignore".text = ''
    !.notes/
    !.gitignore
    !.github/
    !.devcontainer/
    !.env*
    !.sqlx/
    !.cargo/
  '';

  home.file.".config/helix/themes/helix-ayu.toml".source = ./helix-ayu.toml;

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
      vale-ls
      tinymist
      ltex-ls
      nixd
      nil
      ruff
    ];

    settings = {
      theme = lib.mkForce "gruvbox_dark_hard";
      # theme = lib.mkForce "stylix";
      # theme = lib.mkForce "monokai_soda";
      # theme = lib.mkForce "helix-ayu";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";

      };

      editor = {

        line-number = "relative";
        inline-diagnostics.cursor-line = "warning";
        end-of-line-diagnostics = "hint";
        color-modes = true;
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

    languages = {
      language-server.ltex = {
        command = "ltex-ls-plus";
        config.ltex.dictionary."en-US" = [ "ewwe" "flaberrasted" ];
        config.ltex.disabledRules."en-US" = [ "WHITESPACE_RULE" ];

      };

      language-server.rust-analyzer.config.check.command = "clippy";

      language-server.texlab = {
        command = "texlab";
        config.texlab = {
          build = {
            onSave = true;
            forwardSearchAfter = true;
            executable = "latexmk";
            args = [
              "-pdf"
              "-interaction=nonstopmode"
              "-synctex=1"
              "-shell-escape"
              "%f"
            ];
          };
          forwardSearch = {
            executable = "zathura";
            args = [ "--synctex-forward" "%l:%c:%f" "%p" ];
          };
          chktex = {
            onOpenAndSave = true;
            onEdit = true;
          };
        };
      };

      language-server.gdscript = {
        command = "nc";
        args = [ "127.0.0.1" "6005" ];
      };

      language = [
        {
          name = "typst";
          auto-format = true;
          formatter.command = "typstyle";
          # idk how to fucking set this shit up
          # language-servers = [ "tinymist" "vale-ls" ];
          # language-servers = [ "tinymist" "ltex-ls" ];

          language-servers = [ "tinymist" ];
        }
        {
          name = "latex";
          # language-servers = [ "texlab" "ltex-ls-plus" "vale-ls" ];
          language-servers = [ "texlab" "ltex-ls-plus" ];
        }
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
          language-servers = [ "svelteserver" "tailwindcss-language-server" ];
        }
        {
          name = "html";
          language-servers = [ "vscode-html-language-server" "tailwindcss-ls" ];
        }
        {
          name = "css";
          language-servers = [ "vscode-css-language-server" "tailwindcss-ls" ];
        }

        {
          name = "gdscript";
          language-servers = [ "gdscript" ];
          language-id = "gdscript";
        }
      ];
    };

  };
}

