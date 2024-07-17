{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nix Helper
    nh.url = "github:viperML/nh";

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";

    nix-colors.url = "github:misterio77/nix-colors";

    swww.url = "github:LGFae/swww";

    ags.url = "github:Aylur/ags";

    stylix.url = "github:danth/stylix";

    wezterm = {
      url = "github:wez/wezterm?dir=nix";
    };
 inputs.hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , stylix
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
    in
    {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      nixosConfigurations = {
        # FIXME replace with your hostname
        zephryus = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          # > Our main nixos configuration file <
          modules = [ stylix.nixosModules.stylix ./hosts/zephryus ];
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      # homeConfigurations = {
      #   # FIXME replace with your username@hostname
      #   "your-username@your-hostname" = home-manager.lib.homeManagerConfiguration {
      #     pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
      #     extraSpecialArgs = { inherit inputs outputs; };
      #     # > Our main home-manager configuration file <
      #     modules = [ ./home-manager/home.nix ];
      #   };
      # };
    };
}
