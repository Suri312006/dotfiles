{ ... }: {
  # nix-colors
  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    borderRadius = 5;

    extraConfig = ''
    [mode=dnd]
    invisible=1
    '';


  };

}
