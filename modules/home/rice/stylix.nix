{pkgs, ...}:
let
  wallpaper = pkgs.fetchurl {
    url = "http://downloads.bungie.net/images/Wallpapers/S19/1920x1080/d2_S19_Community_Wallpapers_1920x1080_10.jpg";
    sha256 = "sha256-bjmbSBEaQZgbu1dBGFqU5fClqrU2J2qMgJ4Ha67X7jw=";
  };

in
  {
    home.file."~/Pictures/d2.jpg" = wallpaper;

  # stylix.image = wallpaper;
  }
