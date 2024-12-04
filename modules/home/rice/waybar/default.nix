{pkgs, ...}: {
  home.packages = with pkgs; [
    waybar
  ];
  # home.pkgs = with pkgs; [
  #   bluez-utils # Bluetooth utilities
  #   brightnessctl # Adjust screen brightness
  #   hyprland # Hyprland (similar to Hyprlock, which is bundled in Hyprland)
  #   pipewire # PipeWire media server
  #   pipewire-pulse # PulseAudio compatibility for PipeWire
  #   python3 # Python
  #   nerd-fonts-jetbrains-mono # JetBrains Mono Nerd Font
  #   wireplumber # PipeWire session manager
  # ];

  home.file.".config/waybar".source = ./config;
}
