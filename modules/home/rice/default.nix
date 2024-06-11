{ pkgs, inputs, ... }: {
  imports = [
    ./qt.nix
    ./gtk.nix
    ./pywal.nix
    ./eww
    ./mako.nix
    ./ags.nix
  ];

  pywal.enable = true;

  home.packages = [ pkgs.wofi pkgs.nwg-look ];

  home.file."Pictures/Wallpapers" = {
    source = builtins.fetchGit {
      url = "https://github.com/suri312006/wallpaperbank";
      rev = "4ffd596b3ae720e0575152c00987e81ad0f7218e";
    };
  };



  home.file."~/Pictures/Wallpaper.png" = pkgs.fetchurl {
      url = "http://downloads.bungie.net/images/Wallpapers/S19/1920x1080/d2_S19_Community_Wallpapers_1920x1080_10.jpg";
      sha256 = "sha256-bjmbSBEaQZgbu1dBGFqU5fClqrU2J2qMgJ4Ha67X7jw=";
    };

}
