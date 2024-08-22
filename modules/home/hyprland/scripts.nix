# can write scripts in here
{ pkgs, ... }:
let
  suri_toggle_battery_mode = pkgs.writeShellScriptBin "suri_toggle_battery_mode" ''
    BATTERYON=$(hyprctl getoption animations:enabled | awk -F 'int: ' '{print $2}')
    if [ "$BATTERYON" = "1" ] ; then

            hyprctl --batch "\
                keyword animations:enabled 0;\
                keyword decoration:drop_shadow 0;\
                keyword decoration:blur:passes 0;\
                keyword general:gaps_in 0;\
                keyword general:gaps_out 0;\
                keyword general:border_size 1;\
                keyword decoration:rounding 0;\
                misc:vfr true;\
                keyword monitor eDP-1, 1920x1080@165.00, 0x0, 1;"

            swww kill 
            notify-send -e -u low -i "Battery Mode Enabled"
            brightnessctl s 10%
            exit
        else
            # FIXME: need to make wallpapers a global var
            # swww-daemon --format xrgb && swww img "$HOME/Pictures/Wallpapers/.png" &
            swww-daemon --format xrgb && swww img "$HOME/Pictures/a_cartoon_of_a_machine.jpg" &
            sleep 0.1
            hyprctl reload
            brightnessctl s 50%

            # need to get pywall
            #{SCRIPTSDIR}/PywalSwww.sh
            sleep 0.5
            suri_refresh
            notify-send -e -u normal -i  "Battery Mode Disabled."
            exit
        fi
  '';

#TODO: need to work on this later
  suri_refresh = pkgs.whiteShellScriptBin "suri_refresh" ''
        



  '';

  suri_screenlock = pkgs.writeShellScriptBin "suri_screenlock" ''
    /home/suri312006/.config/hypr/scripts/MediaCtrl.sh --stop
    pamixer -m
    sleep 0.5s 
    pids=$(ps ax | grep '/opt/discord/Discord' | awk '{print $1}')
    read -a array <<< "$pids" 
    echo "$array"
    kill $array
    hyprlock

  '';

  suri_polkit_init = pkgs.writeShellScriptBin "suri_polkit_init" ''
    # Find all polkit-gnome executables in the Nix store
    polkit_gnome_paths=$(find /nix/store -name 'polkit-gnome-authentication-agent-1' -type f 2>/dev/null)

    for polkit_gnome_path in $polkit_gnome_paths; do
      # Extract the directory containing the executable
      polkit_gnome_dir=$(dirname "$polkit_gnome_path")

      # Check if the executable is valid and exists
      if [ -x "$polkit_gnome_dir/polkit-gnome-authentication-agent-1" ]; then
        # Start the Polkit-GNOME Authentication Agent
        "$polkit_gnome_dir/polkit-gnome-authentication-agent-1" &
        exit 0
      fi
    done

    # If no valid executable is found, report an error
    echo "No valid Polkit-GNOME Authentication Agent executable found."

  '';

  suri_volume = pkgs.writeShellScriptBin "suri_volume" ''
    ## /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
    # Scripts for volume controls for audio and mic 


    # Get Volume
    get_volume() {
        volume=$(pamixer --get-volume)
        if [[ "$volume" -eq "0" ]]; then
            echo "Muted"
        else
            echo "$volume%"
        fi
    }

    # Get icons
    get_icon() {
        current=$(get_volume)
        if [[ "$current" == "Muted" ]]; then
            echo "$iDIR/volume-mute.png"
        elif [[ "''${current%\%}" -le 30 ]]; then
            echo "$iDIR/volume-low.png"
        elif [[ "''${current%\%}" -le 60 ]]; then
            echo "$iDIR/volume-mid.png"
        else
            echo "$iDIR/volume-high.png"
        fi
    }

    # Notify
    notify_user() {
        if [[ "$(get_volume)" == "Muted" ]]; then
            notify-send -e -h string:x-canonical-private-synchronous:volume_notif -u low -i "$(get_icon)" "Volume: Muted"
        else
            notify-send -e -h int:value:"$(get_volume | sed 's/%//')" -h string:x-canonical-private-synchronous:volume_notif -u low -i "$(get_icon)" "Volume: $(get_volume)"
        fi
    }

    # Increase Volume
    inc_volume() {
        if [ "$(pamixer --get-mute)" == "true" ]; then
            pamixer -u && notify_user
        fi
        pamixer -i 5 && notify_user
    }

    # Decrease Volume
    dec_volume() {
        if [ "$(pamixer --get-mute)" == "true" ]; then
            pamixer -u && notify_user
        fi
        pamixer -d 5 && notify_user
    }

    # Toggle Mute
    toggle_mute() {
    	if [ "$(pamixer --get-mute)" == "false" ]; then
    		pamixer -m && notify-send -e -u low -i "$iDIR/volume-mute.png" "Volume Switched OFF"
    	elif [ "$(pamixer --get-mute)" == "true" ]; then
    		pamixer -u && notify-send -e -u low -i "$(get_icon)" "Volume Switched ON"
    	fi
    }

    # Toggle Mic
    toggle_mic() {
    	if [ "$(pamixer --default-source --get-mute)" == "false" ]; then
    		pamixer --default-source -m && notify-send -e -u low -i "$iDIR/microphone-mute.png" "Microphone Switched OFF"
    	elif [ "$(pamixer --default-source --get-mute)" == "true" ]; then
    		pamixer -u --default-source u && notify-send -e -u low -i "$iDIR/microphone.png" "Microphone Switched ON"
    	fi
    }
    # Get Mic Icon
    get_mic_icon() {
        current=$(pamixer --default-source --get-volume)
        if [[ "$current" -eq "0" ]]; then
            echo "$iDIR/microphone-mute.png"
        else
            echo "$iDIR/microphone.png"
        fi
    }

    # Get Microphone Volume
    get_mic_volume() {
        volume=$(pamixer --default-source --get-volume)
        if [[ "$volume" -eq "0" ]]; then
            echo "Muted"
        else
            echo "$volume%"
        fi
    }

    # Notify for Microphone
    notify_mic_user() {
        volume=$(get_mic_volume)
        icon=$(get_mic_icon)
        notify-send -e -h int:value:"$volume" -h "string:x-canonical-private-synchronous:volume_notif" -u low -i "$icon" "Mic-Level: $volume"
    }

    # Increase MIC Volume
    inc_mic_volume() {
        if [ "$(pamixer --default-source --get-mute)" == "true" ]; then
            pamixer --default-source -u && notify_mic_user
        fi
        pamixer --default-source -i 5 && notify_mic_user
    }

    # Decrease MIC Volume
    dec_mic_volume() {
        if [ "$(pamixer --default-source --get-mute)" == "true" ]; then
            pamixer --default-source -u && notify_mic_user
        fi
        pamixer --default-source -d 5 && notify_mic_user
    }

    # Execute accordingly
    if [[ "$1" == "--get" ]]; then
    	get_volume
    elif [[ "$1" == "--inc" ]]; then
    	inc_volume
    elif [[ "$1" == "--dec" ]]; then
    	dec_volume
    elif [[ "$1" == "--toggle" ]]; then
    	toggle_mute
    elif [[ "$1" == "--toggle-mic" ]]; then
    	toggle_mic
    elif [[ "$1" == "--get-icon" ]]; then
    	get_icon
    elif [[ "$1" == "--get-mic-icon" ]]; then
    	get_mic_icon
    elif [[ "$1" == "--mic-inc" ]]; then
    	inc_mic_volume
    elif [[ "$1" == "--mic-dec" ]]; then
    	dec_mic_volume
    else
    	get_volume
    fi
  '';

  suri_media = pkgs.writeShellScriptBin "suri_media" ''
    ## /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
    # Playerctl


    # Play the next track
    play_next() {
        playerctl -a next
        show_music_notification
    }

    # Play the previous track
    play_previous() {
        playerctl -a previous
        show_music_notification
    }

    # Toggle play/pause
    toggle_play_pause() {
        playerctl -a play-pause
        show_music_notification
    }

    # Stop playback
    stop_playback() {
        playerctl -a stop
        notify-send -e -u low -i "$music_icon" "Playback Stopped"
    }

    # Display notification with song information
    show_music_notification() {
        status=$(playerctl status)
        if [[ "$status" == "Playing" ]]; then
            song_title=$(playerctl metadata title)
            song_artist=$(playerctl metadata artist)
            notify-send -e -u low -i "$music_icon" "Now Playing:" "$song_title\nby $song_artist"
        elif [[ "$status" == "Paused" ]]; then
            notify-send -e -u low -i "$music_icon" "Playback Paused"
        fi
    }

    # Get media control action from command line argument
    case "$1" in
        "--nxt")
            play_next
            ;;
        "--prv")
            play_previous
            ;;
        "--pause")
            toggle_play_pause
            ;;
        "--stop")
            stop_playback
            ;;
        *)
            echo "Usage: $0 [--nxt|--prv|--pause|--stop]"
            exit 1
            ;;
    esac
  '';

in
{
  home = {
    packages = [
      #TODO: write this script
      suri_toggle_battery_mode
      suri_screenlock
      suri_polkit_init
      suri_volume
      suri_media

    ];
  };
}
