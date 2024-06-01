{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      bind =
        [
          "$mod, Q, killactive"
          "$mod, F, fullscreen"
          "$mod SHIFT, Q, closewindow"
          "$mod SHIFT, F, togglefloating"
          "$mod SHIFT, F, togglefloating"

          "$mod, S, exec, firefox"
          "$mod, D, exec, discord"
          "$mod, Return, exec, kitty"
          "$mod, escape, exec, pkill wofi || wofi --show drun -modi drun,filebrowser,run,window"
          "$mod, T, exec, dolphin"

          "$mod, tab, focusmonitor, +1"
          "$mod, right, workspace, m+1"
          "$mod, left, workspace, m-1"

          # Move focus with mod + arrow keys
          "$mod, I, movefocus, u"
          "$mod, E, movefocus, d"
          "$mod, N, movefocus, l"
          "$mod, O, movefocus, r"

          "CTRL ALT, L, exec, suri_screenlock"
          "CTRL ALT, P, exec, suri_wlogout"
          "$mod ALT, L, exec, suri_changelayout"
          "$mod ALT, R, exec, suri_refresh"
          "$mod SHIFT, B, exec, suri_change_blur"
          "$mod ALT, V, exec, suri_clipmanager"
          "CTRL ALT, B, exec, suri_tobble_battery_mode"

          ", xf86audioraisevolume, exec, suri_volume --inc #volume up"
          ", xf86audiolowervolume, exec, suri_volume --dec #volume down"
          ", xf86AudioMicMute, exec, suri_volume --toggle-mic #mute mic"
          ", xf86audiomute, exec, suri_volume --toggle"
          ", xf86Sleep, exec, systemctl suspend  # sleep button "

          ", xf86AudioPlayPause, exec, suri_media --pause"
          ", xf86AudioPause, exec, suri_media --pause"
          ", xf86AudioPlay, exec, suri_media --pause"
          ", xf86AudioNext, exec, suri_media --nxt"
          ", xf86AudioPrev, exec, suri_media --prv"
          ", xf86audiostop, exec, suri_media --stop"

          #TODO: figure out screenshotting
          # screenshot with swappy (another screenshot tool)""
          #"$mod SHIFT, S, exec, grim -g "$(slurp)" - | swappy -f -"


        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList
            (
              x:
              let
                ws =
                  let
                    c = (x + 1) / 10;
                  in
                  builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                "$mod CTRL, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
              ]
            )
            10)
        );





    };
  };
}
