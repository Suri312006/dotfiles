{ pkgs, inputs, ... }:
{
  # home.file."~/Pictures/Wallpaper.png" = wallpaper;

  stylix = {
    enable = true;
    # image = ~/Pictures/Wallpapers/lol.png;
    image = inputs.wallpaper;
    polarity = "dark";

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
