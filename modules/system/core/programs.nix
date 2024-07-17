{ pkgs, inputs, ... }: {
  programs = {
    nano.enable = true;
    zsh.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    };

    # allows normal binaries to run
    nix-ld = {
      enable = true;
      libraries = with pkgs; [

      ];
    };

  };

  users.defaultUserShell = pkgs.zsh;


}
