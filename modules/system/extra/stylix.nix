{ pkgs, inputs, ... }:
{
  # home.file."~/Pictures/Wallpaper.png" = wallpaper;

  stylix.image = ../../wallpapers/curr_wall.png;
  # https://stylix.danth.me/
  stylix = {
    enable = true;
    polarity = "dark";

    # image = pkgs.fetchurl {
    #   url = "http://downloads.bungie.net/images/Wallpapers/S19/1920x1080/d2_S19_Community_Wallpapers_1920x1080_10.jpg";
    #   sha256 = "sha256-bjmbSBEaQZgbu1dBGFqU5fClqrU2J2qMgJ4Ha67X7jw=";
    # };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 16;
    };

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

      sizes = {
        terminal = 9;
        desktop = 12;
        applications = 12;
      };

    };

  };




}
