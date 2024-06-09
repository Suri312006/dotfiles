{ config, ... }:
let
  # variant = config.theme.name;
  # c = config.programs.matugen.theme.colors.colors.${variant};

  font_family = "GeistMono Nerd Font";
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = false;
        no_fade_in = true;
      };

      background = [
        {
          monitor = "";
          path = "$HOME/Pictures/Wallpapers/lol.png";
          blur_passes = 3;
          # blur_size = 6;
          # noise = 0.1;
          contrast = 1.1;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

      input-fields = [
        {
          # monitor = "eDP-1";

          size = {
            width = 250;
            height = 60;
          };

          outline_thickness = 2;

          # outer_color = "rgb(${c.primary})";
          # inner_color = "rgb(${c.on_primary_container})";
          # font_color = "rgb(${c.primary_container})";

          fade_on_empty = false;
          # placeholder_text = ''<span font_family="${font_family}" foreground="##${c.primary_container}">Password...</span>'';

          dots_spacing = 0.3;
          dots_center = true;
        }
      ];

      # time
      labels = [
        {
          monitor = "";
          # text = "$TIME";
          text = ''cmd[update:1000] echo "$(date +"%-I:%M%p")"'';
          # inherit font_family;
          font_size = 120;
          font_family = "JetBrains Mono Nerd Font Mono";
          # color = "rgb(${c.primary})";

          position = {
            x = 0;
            y = -300;
          };

          valign = "top";
          halign = "center";
        }
        {
          # monitor =
          text = "Hi there, $USER";
          color = "$foreground ";
          #color = rgba(255, 255, 255, 0.6)
          font_size = 25;
          font_family = "JetBrains Mono Nerd Font Mono";
          position = {
            x = 0;
            y = -40;
          };
          halign = "center";
          valign = "center";

        }
      ];
    };
  };
}
