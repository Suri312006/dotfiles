{ pkgs, fetchFromGitHub, ... }: {
  programs = {
    zsh.shellAliases.n = "y";
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
      rev = "1c53d7bd79fbd1d85a78bddc8b976fdbafa9e317";
    };
  };

}
