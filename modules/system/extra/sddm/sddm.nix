{ pkgs, ... }:

let tokyo-night-sddm = pkgs.libsForQt5.callPackage ./sddm-theme.nix { };
in {

  services.displayManager.sddm = {
    enable = true;
    theme = "tokyo-night-sddm";
    wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [ tokyo-night-sddm ];

  services.xserver.enable = true;
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };

}
