
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
      rev = "67ddab93712b412428360c70d7cd5a033c4b1327";
    };
  };

}
