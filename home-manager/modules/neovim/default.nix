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
      rev = "87b0d61c985d5044695efc2e60f9d1313d94707c";
    };
  };

  # home.file = {
  #   ".config/nvim".source = ./nvim;
  #
  # };
}
