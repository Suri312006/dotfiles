{ pkgs, ... }:

let
  suri_toggle_dnd = pkgs.writeShellScriptBin "suri_toggle_dnd" ''
    NOTIF_TOGGLE=$HOME/.config/.notiftoggle

    if [ ! -e $TOGGLE ]; then 
      touch $TOGGLE
      makoctl set-mode dnd
    else 
      rm $TOGGLE
      makoctl set-mode default
  '';
in
{
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

  home.packages = [
    suri_toggle_dnd
  ];



    }
