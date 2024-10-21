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
      rev = "7a4014b6e1c2506442aa849c393d54ebb257efdd";
    };
  };

}
