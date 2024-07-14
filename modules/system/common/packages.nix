{ pkgs, inputs, ... }: {

  environment = {
    systemPackages = with pkgs; [
      unzip
      gparted
      fzf
      wget
      gcc
      git
      vim
      kitty
      libnotify
      gnupg

      xfce.thunar


      #swww
      inputs.swww.packages.${pkgs.system}.swww

      wl-clipboard

      networkmanagerapplet

      pamixer

      playerctl

      pavucontrol

      lshw

      gnumake42

      clang-tools

      openssl
    ];
  };
}
