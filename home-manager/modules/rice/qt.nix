{ pkgs, ... }: {
  qt.enable = true;
  qt.platformTheme.name = "qt5ct";
  # qt.style.name = "dracula theme";
  qt.style.package = pkgs.dracula-theme;

  home.packages = [ pkgs.libsForQt5.qt5ct ];
}
