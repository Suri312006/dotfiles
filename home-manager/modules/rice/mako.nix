{pkgs, ...}: {
  # nix-colors
  services.mako = {
    enable = true;
  };

  home.packages = [ pkgs.libnotify];
}
