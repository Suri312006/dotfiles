{ pkgs, ... }: {
  imports = [
    ./hypr.nix
    ./scripts.nix
    ./hyprlock.nix
  ];
  # make stuff work on wayland
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    QT_SCALE_FACTOR_ROUNDING_POLICY = "RoundPreferFloor";
  };

  home.packages = with pkgs; [
    grim
    slurp
    swappy

    brightnessctl
  ];
}
