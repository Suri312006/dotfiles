{ ... }: {
  security.polkit.enable = true;

  programs.dconf.enable = true;
  services.gnome3.gnome-keyring.enable = true;
}
