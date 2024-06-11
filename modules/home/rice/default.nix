{ pkgs, inputs, ... }: {
  imports = [
    ./qt.nix
    ./gtk.nix
    ./pywal.nix
    ./eww
    ./mako.nix
    ./ags.nix
    ./stylix.nix
  ];

  pywal.enable = true;

  home.packages = [ pkgs.wofi pkgs.nwg-look ];

  home.file."Pictures/Wallpapers" = {
    source = builtins.fetchGit {
      url = "https://github.com/suri312006/wallpaperbank";
      rev = "4ffd596b3ae720e0575152c00987e81ad0f7218e";
    };
  };



  # home.file."~/Pictures/Wallpaper.png" = 
}
