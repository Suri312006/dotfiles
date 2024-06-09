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

  home.file.".config/nvim".source = {
    source = fetchFromGitHub {
      owner = "suri312006";
      repo = "nvim";
      rev = "87b0d61c985d5044695efc2e60f9d1313d94707c";
      hash = null;
    };
  };

  # home.file = {
  #   ".config/nvim".source = ./nvim;
  #
  # };
}
