{ pkgs, ... }:

let
  suri_toggle_dnd = pkgs.writeShellScriptBin "suri_toggle_dnd" ''
    NOTIF_TOGGLE=$HOME/.config/.notiftoggle
    NOTIF_FILE=/tmp/.dnd_status

    if [ ! -e $NOTIF_TOGGLE ]; then 
      touch $NOTIF_TOGGLE
      makoctl set-mode dnd
      echo "true" >> $NOTIF_FILE
    else 
      rm $NOTIF_TOGGLE
      makoctl set-mode default
      echo "false" >> $NOTIF_FILE
    fi
  '';
in {
  # nix-colors
  services.mako = {
    enable = true;
    defaultTimeout = 5000;
    borderRadius = 5;

    # extraConfig = ''
    #   [mode=dnd]
    #   invisible=1
    # '';

  };

  home.packages = [ suri_toggle_dnd ];

}
