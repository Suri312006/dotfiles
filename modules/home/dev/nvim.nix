
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
      rev = "8ebad019ceadc020841c3986bdb23333a2a153bd";
    };
  };

}
