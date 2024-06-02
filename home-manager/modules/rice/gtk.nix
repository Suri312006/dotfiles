{ pkgs, ... }: {
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "norzy-cursor-theme";
    };

    theme = {
      package = pkgs.nordic;
      name = "nordic";
    };

    iconTheme = {
      package = pkgs.nordzy-icon-theme;
      name = "nordzy-icon-theme";
    };
  };
}
