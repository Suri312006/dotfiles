{ pkgs, user, inputs, ... }: {
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

#TODO: make rust go into uhhh not here?
      rustup # what do with this?
      gnupg
      dolphin

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

    ];
  };

  # add polkit here?
}
