{ pkgs, ... }: {
  imports = [
    ./qt.nix
    ./gtk.nix
    ./pywal.nix
    ./eww
  ];

  pywal.enable = true;

  home.packages = [ pkgs.wofi pkgs.nwg-look ];

  home.file."Pictures/Wallpapers".source = ./wallpapers;
}
