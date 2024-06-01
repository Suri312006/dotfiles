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
      rebuild = "sudo nixos-rebuild switch --flake /home/suri/dotfiles2#zephryus";
      dots = "cd ~/dotfiles/ && nvim .";
    };
    dirHashes = {
      dots = "$HOME/dotfiles2";
    };
    initExtra = ''
      eval `ssh-agent` &> /dev/null
      ssh-add ~/.ssh/github_private &> /dev/null
      ssh-add ~/.ssh/ucsc_gitlab &> /dev/null
    '';

  };

}

