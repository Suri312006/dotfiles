{ pkgs, config, ... }:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';


in
{


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


      prime = {

        # super power mode
        sync.enable = true;
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        nvidiaBusId = "PCI:01:00:0"; # Found with lspci | grep VGA
        amdgpuBusId = "PCI:07:00:0"; # Found with lspci | grep VGA
      };

    };
  };

  environment.systemPackages = [ nvidia-offload ];

  #NOTE: not sure this is in the right spot

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
