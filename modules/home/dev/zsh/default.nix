{ pkgs, ... }:
let
  zsh_history_fix = pkgs.writeShellScriptBin "zsh_history_fix" ''
    mv ~/.zsh_history ~/.zsh_history_bad
    strings ~/.zsh_history_bad > ~/.zsh_history
    fc -R ~/.zsh_history
    rm ~/.zsh_history_bad

  '';
in {
  programs.zoxide.enable = true;

  home.packages = with pkgs; [ fd eza zsh_history_fix ];
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases.n = "nvim .";
    shellAliases.nv = "nvim";

    # oh my zsh lol
    plugins = [
      # {
      #   name = "powerlevel10k";
      #   src = pkgs.zsh-powerlevel10k;
      #   file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      # }
      # {
      #   name = "powerlevel10k-config";
      #   src = builtins.fetchGit {
      #     url = "https://github.com/Suri312006/powerlevel10k";
      #     rev = "38893dd7b16c5bef8fe77d304b94f77f652b0f3e";
      #   };
      #   # ./p10k-config;
      #   file = "p10k.zsh";
      # }
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];

    # oh-my-zsh = {
    #   enable = true;
    # };
    shellAliases = {
      re = ''
        VERSION=$(($(readlink /nix/var/nix/profiles/system | grep -o "[0-9]*") + 1)) 
        z ~/dots/nixdots && git add -A && git commit -m "Generation: '$VERSION'" && sudo nixos-rebuild switch --flake /home/suri/dots/nixdots#zephryus && git push'';

      ree =
        "sudo nixos-rebuild switch --flake ~/dots/nixdots#zephryus && git push";

      dots = "z ~/dots";
      fcd = ''
        cd "$(find ~/coding/ ~/storage/ -type d -not \( -path "*/.git/*" -o -path "*/target/*" -o -path "*/.venv/*" -o -path "*/node_modules/*" -o -path "*/venv/*" -o -path "*/build/*" -o -path "*/.*/*" \) -print 2>/dev/null | fzf)" '';

      l = "exa";

      lg = "lazygit";
    };
    initExtra = ''
      eval `ssh-agent` &> /dev/null
      ssh-add ~/.ssh/github_private &> /dev/null
      ssh-add ~/.ssh/ucsc_gitlab &> /dev/null
      ssh-add ~/.ssh/connectify &> /dev/null

      eval "$(zoxide init zsh)"
      eval "$(starship init zsh)"

      function y() {
          local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
          yazi "$@" --cwd-file="$tmp"
          if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
                  cd -- "$cwd"
          fi
          rm -f -- "$tmp"
      }

      function tz() {
          if [ -z "$1" ]; then
              echo "Usage: tz <file.typ>"
              return 1
          fi

          input_file="$1"
          output_file="''${input_file%.typ}.pdf"  # Replace .typ with .pdf

          typst watch "$input_file" "$output_file" &  # Watch and compile Typst file
          sleep 1  # Give Typst some time to generate the PDF
          zathura "$output_file"  # Open the generated PDF
      }
    '';
  };
}
