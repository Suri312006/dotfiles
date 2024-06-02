{ pkgs, ... }: {
  home.packages = with pkgs; [ fd eza ];
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
        src = ./p10k-config;
        file = "p10k.zsh";
      }
    ];
    oh-my-zsh = {
      enable = true;
    };
    shellAliases = {
      #TODO: needs to be like the user thing
      rebuild = "sudo nixos-rebuild switch --flake /home/suri/dotfiles#zephryus";
      dots = "cd ~/dotfiles/ && nvim .";
      fcd = ''cd "$(find ~/coding/ ~/storage/ -type d -not \( -path "*/.git/*" -o -path "*/target/*" -o -path "*/.venv/*" -o -path "*/node_modules/*" -o -path "*/venv/*" -o -path "*/build/*" -o -path "*/.*/*" \) -print 2>/dev/null | fzf)" '';


    };
    dirHashes = {
      dots = "$HOME/dotfiles";
    };
    initExtra = ''
      eval `ssh-agent` &> /dev/null
      ssh-add ~/.ssh/github_private &> /dev/null
      ssh-add ~/.ssh/ucsc_gitlab &> /dev/null
    '';

  };

}

