{ pkgs, fetchFromGitHub, ... }: {
  programs = {
    zsh.shellAliases.n = "nvim .";
    zsh.shellAliases.nv = "nvim";

    neovim = {
      enable = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        ripgrep
        fd
      ];
    };

  };

  home.file.".config/nvim" = {
    source = builtins.fetchGit {
      url = "https://github.com/suri312006/nvim";
      rev = "28029bcfc684bc179e95a52eea1e8bb7d9b6dc27";
    };
  };

  # home.file = {
  #   ".config/nvim".source = ./nvim;
  #
  # };
}
