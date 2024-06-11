
{ pkgs, ... }: {
  stylix = {
    enable = true;
    # image = ~/Pictures/Wallpapers/lol.png;
    image = pkgs.fetchurl {
      url = "http://downloads.bungie.net/images/Wallpapers/S19/1920x1080/d2_S19_Community_Wallpapers_1920x1080_10.jpg";
      sha256 = "sha256-bjmbSBEaQZgbu1dBGFqU5fClqrU2J2qMgJ4Ha67X7jw=";
    };
    polarity = "dark";

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.fira-code;
        name = "Fira Code SemiBold";
      };

      monospace = {
        package = pkgs.fantasque-sans-mono;
        name = "Regular";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      targets.kitty = false;
    };
  };

}
