{
  imports = [
    ./qt.nix
    ./gtk.nix
  ];

  home.file."Pictures/Wallpapers".source = ./wallpapers;
}
