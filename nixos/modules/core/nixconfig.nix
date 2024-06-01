# holds the core nixos configuration for the system
{ inputs, pkgs, user, ... }: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "@wheel" ];
    };
  };

  nixpkgs = {
    config = {
      # lookinto later
      allowBroken = true;
      allowUnsupportedSystem = true;
      allowUnfree = true;
    };
  };


}
