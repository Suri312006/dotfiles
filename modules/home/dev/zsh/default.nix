{ pkgs, ... }:
let
  resetScript = (pkgs.writeShellApplication {
    name = "ns";
    runtimeInputs = with pkgs;
      [ git nh ];
    text = ''
      set -e #Exit immediately if a command exits with a non-zero status.
      git diff HEAD -- . '*'
      echo "NixOS Rebuilding ... "
      nh os switch
      gen=$(nixos-rebuild list-generations | grep current | awk '{print $1,$2}')
      read -p "Enter a commit message: " message
      git commit -am "$message ($gen)"
    '';

  });
in
{




  programs.zoxide.enable = true;


  home.packages = with pkgs;
    [ fd eza resetScript ];
  programs.zsh = {
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    # oh my zsh lol
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = builtins.fetchGit {
          url = "https://github.com/Suri312006/powerlevel10k";
          rev = "38893dd7b16c5bef8fe77d304b94f77f652b0f3e";
        };
        # ./p10k-config;
        file = "p10k.zsh";
      }
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }


    ];



    oh-my-zsh = {
      enable = true;
    };
    shellAliases = {
      re = ''
        VERSION=$(($(readlink /nix/var/nix/profiles/system | grep -o "[0-9]*") + 1)) 
        z ~/dots/nixdots && git add -A && git commit -m "Generation: '$VERSION'" && sudo nixos-rebuild switch --flake /home/suri/dots/nixdots#zephryus'';

      ree = ''sudo nixos-rebuild switch --flake ~/dots/nixdots#zephryus'';

      dots = "z ~/dots";
      fcd = ''cd "$(find ~/coding/ ~/storage/ -type d -not \( -path "*/.git/*" -o -path "*/target/*" -o -path "*/.venv/*" -o -path "*/node_modules/*" -o -path "*/venv/*" -o -path "*/build/*" -o -path "*/.*/*" \) -print 2>/dev/null | fzf)" '';


    };
    initExtra = ''
      eval `ssh-agent` &> /dev/null
      ssh-add ~/.ssh/github_private &> /dev/null
      ssh-add ~/.ssh/ucsc_gitlab &> /dev/null
      eval "$(zoxide init zsh)"     
    '';

  };

}


