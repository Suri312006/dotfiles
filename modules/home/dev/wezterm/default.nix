{ inputs, pkgs, ... }: {

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;
    # extraConfig = builtins.readFile ./wezterm.lua;
  };

  home.file.".config/wezterm".source = ./wezterm;

}
