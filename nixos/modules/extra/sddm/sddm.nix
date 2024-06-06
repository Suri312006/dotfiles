{ pkgs, ... }:

let
  tokyo-night-sddm = pkgs.libsForQt5.callPackage ./sddm-theme.nix { };
in
{

  services.displayManager.sddm = {
    enable = true;
    # theme = "${import ./sddm-theme.nix {inherit pkgs; }}";
    # wayland.enable = true;
  };
  services.xserver.displayManager.sddm.theme = "tokyo-night-sddm";
  environment.systemPackages = with pkgs; [ tokyo-night-sddm ];

  services.xserver.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

}
