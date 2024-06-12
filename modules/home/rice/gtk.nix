{ pkgs, ... }: {
  #   home.sessionVariables = { GTK_THEME = "Nordic"; };
  #
  #   home.pointerCursor = {
  #     name = "Bibata-Modern-Ice";
  #     package = pkgs.bibata-cursors;
  #     size = 16;
  #   };
  #
  #
  gtk = {
    #     enable = true;
    #     # theme = {
    #     #   name = "Dracula";
    #     #   package = pkgs.dracula-theme;
    #     # };
    #     # theme = {
    #     #   name = "Nordic";
    #     #   package = pkgs.nordic;
    #     # };
    #     theme = {
    #       name = "Nordic";
    #       package = pkgs.nordic;
    #     };
    #
    #     # cursorTheme = {
    #     #   name = "Catppuccin-Mocha-Dark-Cursors";
    #     #   package = pkgs.catppuccin-cursors.mochaDark;
    #     # };
    #
    #     cursorTheme = {
    #       package = pkgs.bibata-cursors;
    #       name = "Bibata-Modern-Ice";
    #     };
    #
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    #
    #     font = {
    #       name = "JetBrainsMono Nerd Font";
    #       size = 11;
    #     };
    #
    #     gtk3.extraConfig = {
    #       gtk-xft-antialias = 1;
    #       gtk-xft-hinting = 1;
    #       gtk-xft-hintstyle = "hintslight";
    #       gtk-xft-rgba = "rgb";
    #       gtk-cursor-theme-name = "Bibata-Modern-Ice";
    #     };
    #
    #     gtk2.extraConfig = ''
    #       gtk-xft-antialias=1
    #       gtk-xft-hinting=1
    #       gtk-xft-hintstyle="hintslight"
    #       gtk-xft-rgba="rgb"
    #     '';
    #     gtk4.extraConfig = {
    #       gtk-xft-antialias = 1;
    #       gtk-xft-hinting = 1;
    #       gtk-xft-hintstyle = "hintslight";
    #       gtk-xft-rgba = "rgb";
    #       gtk-cursor-theme-name = "Bibata-Modern-Ice";
    #     };
    #   };
    #
    #   qt = {
    #     enable = true;
    #     platformTheme.name = "gtk";
  };
}
