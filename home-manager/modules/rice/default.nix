{pkgs, ...}:{
  imports = [
    ./qt.nix
    ./gtk.nix
    ./pywal.nix
    ./eww
  ];

  home.packages = [ pkgs.wofi pkgs.nwg-look ];

  home.file."Pictures/Wallpapers".source = ./wallpapers;
}
