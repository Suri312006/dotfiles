{pkgs, ...}:{
  imports = [
    ./qt.nix
    ./gtk.nix
    ./pywal.nix
    ./eww
  ];

  home.packages = [ pkgs.wofi ];

  home.file."Pictures/Wallpapers".source = ./wallpapers;
}
