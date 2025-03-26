{ lib, home, ... }: {

  programs.starship = { enable = true; };
  # home.file.".config/starship.toml".source = lib.mkForce ./starship.toml;

}
