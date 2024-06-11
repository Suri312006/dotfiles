{ pkgs, inputs, ... }:
let

  wallpaper = pkgs.fetchurl {
    url = "http://downloads.bungie.net/images/Wallpapers/S19/1920x1080/d2_S19_Community_Wallpapers_1920x1080_10.jpg";
    sha256 = "sha256-bjmbSBEaQZgbu1dBGFqU5fClqrU2J2qMgJ4Ha67X7jw=";
  };
in
{
  # home.file."~/Pictures/Wallpaper.png" = wallpaper;

  stylix.image = wallpaper;

  stylix = {
    enable = true;
    # image = ~/Pictures/Wallpapers/lol.png;
    # image = inputs.wallpaper;
    polarity = "dark";

    # image = pkgs.fetchurl {
    #   url = "http://downloads.bungie.net/images/Wallpapers/S19/1920x1080/d2_S19_Community_Wallpapers_1920x1080_10.jpg";
    #   sha256 = "sha256-bjmbSBEaQZgbu1dBGFqU5fClqrU2J2qMgJ4Ha67X7jw=";
    # };

    # image = /home/suri/Pictures/d2.jpg;

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      # serif = {
      #   package = pkgs.fira-code;
      #   name = "Fira Code Bold";
      # };

      # sansSerif =/*   */{
      #   package = pkgs.fira-code;
      #   name = "Fira Code Bold";
      # };

      # monospace = {
      #   package = pkgs.fantasque-sans-mono;
      #   name = "Regular";
      # };
      monospace = {
        package = pkgs.fira-code;
        name = "Fira Code SemiBold";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };


}
