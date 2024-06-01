{ pkgs, ... }: {


  networking.networkmanager.enable = true;
  networking = {
    hostName = "zephryus";
  };
  services.openssh = { enable = true; };
  # theres some cloud flare stuff you could do too

  programs.nm-applet.enable = true;

  # bluetooth stuff
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;

  };

  services.blueman.enable = true;
  services.pipewire.wireplumber.extraConfig = {
    "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
      "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
    };
  };


}
