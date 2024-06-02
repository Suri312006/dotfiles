{ pkgs, ... }: {

  services.displayManager.sddm = {
    enable = true;
    theme = "${import ./sddm-theme.nix {inherit pkgs; }}";

    # wayland.enable = true;

  };
  services.xserver.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

}
