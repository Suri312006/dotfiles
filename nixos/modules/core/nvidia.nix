{ pkgs, config, ... }: {


  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    opengl.enable = true;

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;

      open = false;
      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;

    };
  };

  hardware.nvidia.prime.sync.enable = true;

  hardware.nvidia.prime = {
    nvidiaBusId = "PCI:01:00:0"; # Found with lspci | grep VGA
    amdgpuBusId = "PCI:07:00:0"; # Found with lspci | grep VGA
  };


  #NOTE: not sure this is in the right spot
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # services.supergfxd = {
  #   enable = true;
  #   settings = {
  #     # mode = "Integrated";
  #     vfio_enable = true;
  #     vfio_save = false;
  #     always_reboot = false;
  #     no_logind = false;
  #     logout_timeout_s = 20;
  #     hotplug_type = "Asus";
  #   };
  # };

}
