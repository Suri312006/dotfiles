{ pkgs, inputs, ... }: {
  # imports = [
  #   inputs.hyprland.homeManagerModules.default
  # ];

  home.packages = with pkgs;
    [

      kdePackages.xwaylandvideobridge
    ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      "$mod" = "SUPER";

      exec-once = [
        "swww query || swww-daemon --format xrgb &"
        "swww img ~/Pictures/curr_wall.jpg &"
        # Startup
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        # "ags &"
        "waybar &"

        # Polkit (Polkit Gnome / KDE)
        "suri_polkit_init &"
        # starup apps
        "nm-applet --indicator &"
        # "rog-control-center &"
        "blueman-applet & "
        # "webcord &"
        # "zen &"
        "firefox &"
        "google-chrome-stable &"
        "spotify &"
        # "zeditor &"

        "discord &"
        "zulip &"
        "slack && sleep 2 &"

        # "sleep 1 && slack &" # time delay for slack
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      monitor = [
        "eDP-1, 1920x1080@165.00, 0x0, 1"
        # "eDP-1, 2560x1440@165.00, 0x0, 1"
        # "DP-3, 1920x1080@74.97, 1920x0, 1"
        "HDMI-A-1, 1920x1080@74.97, 1920x0, 1"
        # "HDMI-A-1, 1920x1080@74.97, 2560x0, 1"
        # "HDMI-A-1, 3840x2160@74.99, 1920x0, 1"
        # "DP-1, 1920x1080@74.97, 1920x0, 1"
        "DP-3, 1920x1080@74.67, 3840x0, 1, transform, 3"
        # "DP-3, 1920x1080@74.67, 4480x0, 1, transform, 3"
      ];

      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

      # windowrule = [
      #   "float, org.kde.polkit-kde-authentication-agent-1"
      #   "float, nm-connection-editor|blueman-manager"
      #   "float, pavucontrol"
      #   "float, nwg-look|qt5ct|mpv"
      #   "float, onedriver|onedriver-launcher"
      #   "float, eog"
      #   "float, zoom"
      #   "float, rofi"
      #   "float, gnome-system-monitor"
      #   "float, CoupledCats"
      #   "center = ^(pavucontrol)"
      # ];
      windowrulev2 = [
        # windowrule v2
        "workspace 1 silent,  class:^(dev.zed.Zed)$"
        "workspace 1 silent,  class:^(Godot)$"
        "workspace 4 silent,  class:^([Gg]oogle-chrome)$"
        "workspace 3 silent, class:^(zen)$"
        "workspace 3 silent, class:^(firefox)$"
        "workspace 5 silent,  class:^(blender)$"
        "workspace 6 silent, class:^(obsidian)$"
        "workspace 7 silent, class:^(discord)$"
        "workspace 9 silent, class:^(WebCord)$"
        "workspace 8 silent, title:^(Spotify Free)$"
        "workspace 8 silent, class:^(Spotify)$"
        "workspace 9 silent, class:^(Slack)$"
        "workspace 9 silent, class:^(Zulip)$"

        # opacity (transparent) #enable as desired
        "opacity 0.9 0.9, class:^([Rr]ofi)$"
        "opacity 0.9 0.95, class:^(zen)$"
        "opacity 0.9 0.9, class:^([Gg]oogle-chrome)$"
        "opacity 0.9 0.9, class:^([Tt]hunar)$"
        "opacity 0.8 0.9, class:^(pcmanfm-qt)$"
        "opacity 0.9 0.9, class:^(gedit)$"
        "opacity 0.85 0.9, class:^(org.wezfurlong.wezterm)$"
        "opacity 0.9 0.9, class:^(dev.zed.Zed)$"
        "opacity 0.85 0.9, class:^(kitty)$"
        "opacity 0.9 0.9, class:^(mousepad)$"
        "opacity 0.99 0.95, class:^(codium-url-handler)$"
        "opacity 0.9 0.9, class:^(discord)$"
        "opacity 0.9 0.9, class:^(WebCord)$"
        "opacity 0.9 0.6, class:^(yad)$"
        "opacity 0.8 0.8, title:^(Spotify)$"
        "opacity 0.9 0.9, class:^([Ss]lack)$"
        "opacity 0.9 0.9, class:^(Zulip)$"
        "opacity 0.95 0.95, title:(.*)(Visual Studio Code)$"
        "opacity 0.9 0.9, class:^(com.mitchellh.ghostty)"
        "opacity 0.9 0.9, class:^(obsidian)$"
        "opacity 0.95 0.75, title:^(Picture-in-Picture)$" # for opacity: [focus num] [bg num]

        # Interestingly, the opacity rule above doesn't need the reduplication?
        "pin, title:^(Picture-in-Picture)$"
        # "pin = title:^(zen)$"
        "float, title:^(Picture-in-Picture)$"
        # "float = title:^(zen)$"
        "size 25% 25% = title:^(Picture-in-Picture)$"
        # "size 25% 25% = title:^(zen)$"
        "move 72% 7% = title:^(Picture-in-Picture)$"
        # "move 72% 7% = title:^(zen)$"

        #screen sharing stuff
        "opacity 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"

        # coupled cats window rules
        "noblur,class:^(coupled-cats)$"
        "noborder,class:^(coupled-cats)$"
        "nodim,class:^(coupled-cats)$"
        "noinitialfocus,class:^(coupled-cats)$"
        "noshadow,class:^(coupled-cats)$"
      ];

      bind = [
        "$mod, Q, killactive"
        "$mod, F, fullscreen"
        "$mod SHIFT, Q, closewindow"
        "$mod SHIFT, F, togglefloating"
        "$mod SHIFT, F, togglefloating"

        # "$mod, S, exec, zen"
        "$mod, S, exec, firefox"
        "$mod, D, exec, discord"
        # "$mod, D, exec, webcord"
        # "$mod, Return, exec, wezterm-gui start --always-new-process"
        "$mod, Return, exec, ghostty -e suri_zellij_session_helper"
        # "$mod, escape, exec, pkill wofi || wofi --show drun -modi drun,filebrowser,run,window"
        "$mod, escape, exec, ~/.config/rofi/launchers/type-5/launcher.sh"
        # "$mod, escape, exec, pkill rofi || rofi -show drun -modi drun,filebrowser,run,window"
        "$mod, T, exec, thunar"

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
        "CTRL ALT, B, exec, suri_toggle_battery_mode"

        ''$mod SHIFT, S, exec, grim -g "$(slurp)" - | swappy -f -''

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
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (x:
          let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            "$mod CTRL, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
          ]) 10));

      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];

      workspace = [
        # "1, monitor:DP-3"
        # "2, monitor:DP-3"
        # "3, monitor:DP-3"
        # "4, monitor:DP-3"
        "9, monitor:DP-3"
        "10, monitor:DP-3"

        "1, monitor:HDMI-A-1"
        "2, monitor:HDMI-A-1"
        "3, monitor:HDMI-A-1"
        "4, monitor:HDMI-A-1"
        "5, monitor:HDMI-A-1"

        "6, monitor:eDP-1"
        "7, monitor:eDP-1"
        "8, monitor:eDP-1"
        # "9, monitor:eDP-1"
        # "10, monitor:eDP-1"
      ];

      dwindle = {
        pseudotile = "yes";
        # force_split = "0";
        preserve_split = "yes";
        # smart_split = true;
        # smart_resizing = false;
        special_scale_factor = 0.8;
      };

      master = {
        # new_is_master = 1;
        new_on_top = 1;
        # mfact = 0.34;
        # always_center_master = true;
        orientation = "top";
      };

      general = {
        # sensitivity = 1.00;
        # apply_sens_to_raw = 1;
        gaps_in = 2;
        gaps_out = 5;
        border_size = 2;
        resize_on_border = true;

        #TODO: nix colors here
        # col.active_border = $color0 $color2 $color4 $color6 $color8 90deg
        # col.inactive_border = $backgroundCol

        layout = "dwindle";
      };

      decoration = {
        rounding = 3;

        active_opacity = 1.0;
        inactive_opacity = 0.9;
        fullscreen_opacity = 1.0;

        dim_inactive = true;
        dim_strength = 0.1;

        # drop_shadow = true;
        # shadow_range = 6;
        # shadow_render_power = 1;
        # col.shadow = $color2
        # "col.shadow_inactive" = "0x50000000";

        blur = {
          enabled = true;
          size = 5;
          passes = 2;
          ignore_opacity = true;
          new_optimizations = true;
        };
      };

      animations = {
        enabled = "yes";
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
          "linear, 0.0, 0.0, 1.0, 1.0"
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "slow, 0, 0.85, 0.3, 1"
          "overshot, 0.7, 0.6, 0.1, 1.1"
          "bounce, 1.1, 1.6, 0.1, 0.85"
          "slingshot, 1, -1, 0.15, 1.25"
          "nice, 0, 6.9, 0.5, -4.20"
        ];

        animation = [
          "windowsIn, 1, 1, winIn, popin"
          "windowsOut, 1, 1, winOut, popin"
          "windowsMove, 1, 1, myBezier, popin"
          "border, 1, 10, linear"
          "borderangle, 1, 180, linear, loop" # used by rainbow borders and rotating colors
          "fade, 1, 5, overshot"
          "workspaces, 1, 2, myBezier"
          "windows, 1, 5, bounce, popin"
        ];
      };

      input = {
        kb_layout = "us";
        # kb_variant =
        # kb_model=
        # kb_options=grp:alt_shift_toggle, altwin:swap_lalt_lwin, caps:swapescape,
        kb_options = "grp:alt_shift_toggle";
        # kb_rules=
        repeat_rate = 50;
        repeat_delay = 300;
        numlock_by_default = 1;
        left_handed = 0;
        follow_mouse = 1;
        float_switch_override_focus = 0;
        accel_profile = "flat";
        # force_no_accel = 1;

        touchpad = {
          disable_while_typing = 1;
          natural_scroll = 1;
          clickfinger_behavior = 0;
          middle_button_emulation = 1;
          tap-to-click = 1;
          drag_lock = 0;
        };

      };

      gestures = {
        workspace_swipe = 1;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 400;
        workspace_swipe_invert = 1;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = 1;
        workspace_swipe_forever = 1;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        # chugs perf but butter smooth
        vfr = 0;
        enable_swallow = true;
        # no_direct_scanout = true; #for fullscreen games
        focus_on_activate = false;
        swallow_regex = "^(kitty)$";
        #disable_autoreload = true
      };

      binds = {
        workspace_back_and_forth = 1;
        allow_workspace_cycles = 1;
        pass_mouse_when_bound = 0;
      };

      #Could help when scaling and not pixelating
      xwayland = { force_zero_scaling = true; };
    };
  };
}
