{ ... }: {
  security.polkit.enable = true;

  programs.dconf.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
