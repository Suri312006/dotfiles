{ pkgs, inputs, ... }: {
  environment = {
    systemPackages = with pkgs; [
      btop
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

      #stuff for the thing
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects

      #swww
      inputs.swww.packages.${pkgs.system}.swww

      wl-clipboard

      networkmanagerapplet

      pamixer
      playerctl
      pavucontrol

      lshw

    ];
  };

  # add polkit here?
}
