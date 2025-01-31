# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ inputs, lib, config, pkgs, outputs, ... }: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    # Import home-manager's NixOS module
    inputs.home-manager.nixosModules.home-manager

    # import all and enable all
    ../../modules/system
  ];

  programs.rog-control-center.enable = true;

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys =
      [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  # valgrant
  # Minimal configuration for NFS support with Vagrant.
  #services.nfs.server.enable = true;

  # Add firewall exception for VirtualBox provider
  networking.firewall.extraCommands = ''
    ip46tables -I INPUT 1 -i vboxnet+ -p tcp -m tcp --dport 2049 -j ACCEPT
  '';

  # Add firewall exception for libvirt provider when using NFSv4
  networking.firewall.interfaces."virbr1" = {
    allowedTCPPorts = [ 80 8080 ];
    allowedUDPPorts = [ 8080 80 ];
  };

  environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };

  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          (pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    # backupFileExtension = "backup";
    users = {
      # Import your home-manager configuration
      suri = import ../../users/suri/home.nix;
    };
  };

  home-manager.backupFileExtension = "backup";

  services.udev.extraRules = ''
    ATTRS{idVendor}=="0d28", ATTRS{idProduct}=="0204", MODE="664", GROUP="m"    
  '';

  # # Enable common container config files in /etc/containers
  # virtualisation.containers.enable = true;
  # virtualisation = {
  #   podman = {
  #     enable = true;

  #     # Create a `docker` alias for podman, to use it as a drop-in replacement
  #     dockerCompat = true;

  #     # Required for containers under podman-compose to be able to talk to each other.
  #     defaultNetwork.settings.dns_enabled = true;
  #   };
  # };

  # # Useful other development tools
  # environment.systemPackages = with pkgs; [
  #   dive # look into docker image layers
  #   podman-tui # status of containers in the terminal
  #   docker-compose # start group of containers for dev
  #   podman-compose # start group of containers for dev
  # ];
  # nixpkgs = {
  #   # You can add overlays here
  #   overlays = [
  #     # If you want to use overlays exported from other flakes:
  #     # neovim-nightly-overlay.overlays.default
  #
  #     # Or define it inline, for example:
  #     # (final: prev: {
  #     #   hi = final.hello.overrideAttrs (oldAttrs: {
  #     #     patches = [ ./change-hello-to-hi.patch ];
  #     #   });
  #     # })
  #   ];
  #   # Configure your nixpkgs instance
  #   config = {
  #     # Disable if you don't want unfree packages
  #     allowUnfree = true;
  #   };
  # };
  #
  # nix =
  #   let
  #     flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  #   in
  #   {
  #     settings = {
  #       # Enable flakes and new 'nix' command
  #       experimental-features = "nix-command flakes";
  #       # Opinionated: disable global registry
  #       flake-registry = "";
  #       # Workaround for https://github.com/NixOS/nix/issues/9574
  #       nix-path = config.nix.nixPath;
  #     };
  #     # Opinionated: disable channels
  #     channel.enable = false;
  #
  #     # Opinionated: make flake registry and nix path match flake inputs
  #     registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
  #     nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  #   };

  # FIXME: Add the rest of your current configuration

  # TODO: Set your hostname
  # networking.hostName = "your-hostname";

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    # FIXME: Replace with your username
    suri = {
      # TODO: You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      initialPassword = "suri";
      isNormalUser = true;

      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = [ "wheel" "libvirtd" "docker" "audio" ];
    };
  };
  boot.extraModprobeConfig = ''
    options snd-hda-intel dmic_detect=0
  '';
  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  # services.openssh = {
  #   enable = true;
  #   settings = {
  #     # Opinionated: forbid root login through SSH.
  #     PermitRootLogin = "no";
  #     # Opinionated: use keys only.
  #     # Remove if you want to SSH using passwords
  #     PasswordAuthentication = false;
  #   };
  # };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
