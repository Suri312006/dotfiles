{ pkgs, ... }: {

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  #NOTE: not sure this is in the right spot
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.supergfxd = {
    enable = true;
    settings = {
      # mode = "Integrated";
      vfio_enable = true;
      vfio_save = false;
      always_reboot = false;
      no_logind = false;
      logout_timeout_s = 20;
      hotplug_type = "Asus";
    };
  };

}
