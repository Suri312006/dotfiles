{ pkgs, ... }: {
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "norzy-cursor-theme";
    };

    theme = {
      package = pkgs.dracula-theme;
      name = "dracula";
    };

    iconTheme = {
      package = pkgs.dracula-icon-theme;
      name = "dracula-theme";
    };
  };
}
