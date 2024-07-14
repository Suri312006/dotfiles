{ ... }: {

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;

    extraConfig = builtins.readFile ./wezterm.lua;
  };

  # home.file.".config/wezterm/wezterm.lua".source = ./wezterm.lua;

}
