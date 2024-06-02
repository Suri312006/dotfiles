{ pkgs, ... }: {
  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "pkgs.dracula-theme";
  qt.style.package = pkgs.dracula-theme;

  home.packages = [ pkgs.libsforQt5.qt5ct ];
}
