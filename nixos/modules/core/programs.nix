{pkgs, ...}:{
  programs = {
    nano.enable = true;
    zsh.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
