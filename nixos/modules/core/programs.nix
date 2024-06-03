{pkgs, ...}:{
  programs = {
    nano.enable = true;
    zsh.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    nix-ld = {
      enable = true;
      libraries = with pkgs; [

      ];
    };

  };

  users.defaultUserShell = pkgs.zsh;


}
