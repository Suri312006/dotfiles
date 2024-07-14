{ pkgs, ... }:

let
  tokyo-night-sddm = pkgs.libsForQt5.callPackage ./sddm-theme.nix { };
in
{
  environment.systemPackages = with pkgs;[

    #stuff for the thing
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects

    tokyo-night-sddm
  ];

  services.displayManager.sddm = {
    enable = true;
    theme = "tokyo-night-sddm";
    wayland.enable = true;
  };


  services.xserver.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

}
