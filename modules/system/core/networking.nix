{pkgs, ...}: {
  networking.networkmanager.enable = true;
  networking = {
    hostName = "zephryus";
  };
  services.openssh = {enable = true;};
  # theres some cloud flare stuff you could do too

  programs.nm-applet.enable = true;
}
