{ pkgs, ... }: {



  programs.zoxide.enable = true;


  home.file."p10k.zsh".source = builtins.fetchGit {
    url = "https://github.com/Suri312006/powerlevel10k";
    rev = "38893dd7b16c5bef8fe77d304b94f77f652b0f3e";
  };

  home.packages = with pkgs;
    [ fd eza ];
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
      # {
      #   name = "powerlevel10k-config";
      #   src = ./p10k-config;
      #   file = "p10k.zsh";
      # }
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
      eval "$(zoxide init zsh)"     
    '';

  };

}


