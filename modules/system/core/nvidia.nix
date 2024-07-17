# # info here https://nixos.wiki/wiki/Nvidia
# { pkgs, config, libs, ... }:
#
# {
#
#   # Enable OpenGL
#   hardware.opengl = {
#     enable = true;
#   };
#
#   # Load nvidia driver for Xorg and Wayland
#   services.xserver.videoDrivers = [ "nvidia" ];
#
#   hardware.nvidia.modesetting.enable = true;
#   hardware.nvidia.powerManagement.enable = false;
#   hardware.nvidia.powerManagement.finegrained = false;
#   hardware.nvidia.open = false;
#   hardware.nvidia.nvidiaSettings = true;
#   # Special config to load the latest (535 or 550) driver for the support of the 4070 SUPER
#   hardware.nvidia.package =
#     let
#       rcu_patch = pkgs.fetchpatch {
#         url = "https://github.com/gentoo/gentoo/raw/c64caf53/x11-drivers/nvidia-drivers/files/nvidia-drivers-470.223.02-gpl-pfn_valid.patch";
#         hash = "sha256-eZiQQp2S/asE7MfGvfe6dA/kdCvek9SYa/FFGp24dVg=";
#       };
#     in
#     config.boot.kernelPackages.nvidiaPackages.mkDriver {
#       version = "535.154.05";
#       sha256_64bit = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
#       sha256_aarch64 = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
#       openSha256 = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
#       settingsSha256 = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
#       persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";
#
#       # version = "550.40.07";
#       # sha256_64bit = "sha256-KYk2xye37v7ZW7h+uNJM/u8fNf7KyGTZjiaU03dJpK0=";
#       # sha256_aarch64 = "sha256-AV7KgRXYaQGBFl7zuRcfnTGr8rS5n13nGUIe3mJTXb4=";
#       # openSha256 = "sha256-mRUTEWVsbjq+psVe+kAT6MjyZuLkG2yRDxCMvDJRL1I=";
#       # settingsSha256 = "sha256-c30AQa4g4a1EHmaEu1yc05oqY01y+IusbBuq+P6rMCs=";
#       # persistencedSha256 = "sha256-11tLSY8uUIl4X/roNnxf5yS2PQvHvoNjnd2CB67e870=";
#
#       patches = [ rcu_patch ];
#     };
#
#
#
# }

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

      # causes kernel panics lmao
      # package = config.boot.kernelPackages.nvidiaPackages.stable;

      package =
        let
          rcu_patch = pkgs.fetchpatch {
            url = "https://github.com/gentoo/gentoo/raw/c64caf53/x11-drivers/nvidia-drivers/files/nvidia-drivers-470.223.02-gpl-pfn_valid.patch";
            hash = "sha256-eZiQQp2S/asE7MfGvfe6dA/kdCvek9SYa/FFGp24dVg=";
          };
        in
        config.boot.kernelPackages.nvidiaPackages.mkDriver {
          version = "535.154.05";
          sha256_64bit = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
          sha256_aarch64 = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
          openSha256 = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
          settingsSha256 = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
          persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";

          # version = "550.40.07";
          # sha256_64bit = "sha256-KYk2xye37v7ZW7h+uNJM/u8fNf7KyGTZjiaU03dJpK0=";
          # sha256_aarch64 = "sha256-AV7KgRXYaQGBFl7zuRcfnTGr8rS5n13nGUIe3mJTXb4=";
          # openSha256 = "sha256-mRUTEWVsbjq+psVe+kAT6MjyZuLkG2yRDxCMvDJRL1I=";
          # settingsSha256 = "sha256-c30AQa4g4a1EHmaEu1yc05oqY01y+IusbBuq+P6rMCs=";
          # persistencedSha256 = "sha256-11tLSY8uUIl4X/roNnxf5yS2PQvHvoNjnd2CB67e870=";

          patches = [ rcu_patch ];
        };

      prime = {

        # super power mode
        sync.enable = true;

        # cannot be enabled at the same time as sync
        offload = {
          # enable = true;
          enable = false;
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
