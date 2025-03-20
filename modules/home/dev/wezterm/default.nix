{ inputs, pkgs, ... }: {

  programs.wezterm = {
    enable = false;
    # enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;
    # extraConfig = builtins.readFile ./wezterm.lua;
  };

  home.file.".config/wezterm".source = ./wezterm;
  stylix.targets.wezterm.enable = false;

}
