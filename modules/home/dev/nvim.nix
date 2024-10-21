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
      rev = "0ec7586dc22d7f834006a0e09d3e97bf811e83a8";
    };
  };

}
